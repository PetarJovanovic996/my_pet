import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/gen/assets.gen.dart';
import 'package:my_pet/presentations/cubit/authentication/sign_in_cubit.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: translations.singIn, showSignOut: false),
      body: const Padding(padding: EdgeInsets.all(18), child: SignInForm()),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 30,
              left: 16,
              right: 16,
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 18,
              children: [
                Column(
                  children: [
                    Text(
                      translations.almostThere,

                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(translations.enterSingInInfo),
                  ],
                ),
                const SizedBox(height: 16),

                const _EmailInput(),
                const _PasswordInput(),
                if (state.status.isInProgress)
                  const CircularProgressIndicator(),
                const SizedBox(height: 16),
                const _SignInButton(),
                Image.asset(Assets.images.appLogo.path, height: 140),
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
            labelText: translations.email,
            errorText:
                state.email.displayError != null
                    ? translations.invalidEmail
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
          initialValue: state.password.value,
          obscureText: true,
          onChanged:
              (password) =>
                  context.read<SignInCubit>().enteredPassword(password),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: translations.password,
            errorText:
                state.password.displayError != null
                    ? translations.invalidPassword
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
          child: Text(translations.singIn),
        );
      },
    );
  }
}
