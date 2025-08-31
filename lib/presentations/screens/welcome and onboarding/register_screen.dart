import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/gen/assets.gen.dart';
import 'package:my_pet/presentations/cubit/authentication/register_cubit.dart';
import 'package:my_pet/presentations/widgets/loading_widget.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: translations.register, showSignOut: false),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: BlocProvider(
          create:
              (context) =>
                  RegisterCubit(context.read<AuthenticationRepository>()),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(translations.successfullRegistration)),
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
                state.errorMessage ?? translations.invalidRegistration,
              ),
            ),
          );
        }
      },
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
                Text(
                  translations.enterUserData,
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).hintColor,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(height: 16),

                const _NameInput(),
                const _UsernameInput(),
                const _EmailInput(),
                const _PasswordInput(),
                const _ConfirmPasswordInput(),
                if (state.status.isInProgress)
                  LoadingWidget(color: Theme.of(context).primaryColor),
                const SizedBox(height: 16),
                const _RegisterButton(),
                Image.asset(Assets.images.appLogo.path, height: 140),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.name != curr.name,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.name.value,
          onChanged: (name) => context.read<RegisterCubit>().enteredName(name),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: translations.name,
            errorText:
                state.name.displayError != null
                    ? translations.invalidName
                    : null,
          ),
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.username != curr.username,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.username.value,
          onChanged:
              (username) =>
                  context.read<RegisterCubit>().enteredUsername(username),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: translations.username,
            errorText:
                state.username.displayError != null
                    ? translations.invalidUserName
                    : null,
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.email != curr.email,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          onChanged:
              (email) => context.read<RegisterCubit>().enteredEmail(email),
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.password != curr.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          initialValue: state.password.value,
          onChanged:
              (password) =>
                  context.read<RegisterCubit>().enteredPassword(password),
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

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen:
          (prev, curr) =>
              prev.confirmedPassword != curr.confirmedPassword ||
              prev.password != curr.password,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.confirmedPassword.value,
          obscureText: true,
          onChanged:
              (password) => context
                  .read<RegisterCubit>()
                  .enteredConfirmedPassword(password),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: translations.confirmPassword,
            errorText:
                state.confirmedPassword.displayError != null
                    ? translations.passwordDontMatch
                    : null,
          ),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed:
              state.isValid
                  ? () => context.read<RegisterCubit>().register()
                  : null,
          child: Text(translations.register),
        );
      },
    );
  }
}
