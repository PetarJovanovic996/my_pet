import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/l10n/app_localizations.dart';
import 'package:my_pet/presentations/cubit/authentication/sign_in_cubit.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: AppLocalizations.of(context)!.singIn,
        showSignOut: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: BlocProvider(
          create: (context) => SignInCubit(AuthenticationRepository()),
          child: const SignInFormn(),
        ),
      ),
    );
  }
}

class SignInFormn extends StatelessWidget {
  const SignInFormn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.successfullSignIn),
            ),
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeScreen,
            (Route<dynamic> route) => false,
          );
        }
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage ??
                    AppLocalizations.of(context)!.invalidSignIn,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 30, left: 16, right: 16, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 18,
              children: [
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.almostThere,

                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(AppLocalizations.of(context)!.enterSingInInfo),
                  ],
                ),
                const SizedBox(height: 16),

                const _EmailInput(),
                const _PasswordInput(),
                if (state.status.isInProgress)
                  const CircularProgressIndicator(),
                const SizedBox(height: 16),
                const _SignInButton(),
                Image.asset('assets/images/appLogo.jpg', height: 140),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (prev, curr) => prev.email != curr.email,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          onChanged: (email) => context.read<SignInCubit>().enteredEmail(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email,
            errorText:
                state.email.displayError != null
                    ? AppLocalizations.of(context)!.invalidEmail
                    : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (prev, curr) => prev.password != curr.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          initialValue: state.password.value,
          onChanged:
              (password) =>
                  context.read<SignInCubit>().enteredPassword(password),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.password,
            errorText:
                state.password.displayError != null
                    ? AppLocalizations.of(context)!.invalidPassword
                    : null,
          ),
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed:
              state.isValid ? () => context.read<SignInCubit>().signIn() : null,
          child: Text(AppLocalizations.of(context)!.singIn),
        );
      },
    );
  }
}
