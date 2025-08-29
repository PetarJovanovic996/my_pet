import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/presentations/cubit/settings/change_language/language_cubit.dart';
import 'package:my_pet/presentations/cubit/settings/change_theme/change_theme_cubit.dart';
import 'package:my_pet/presentations/cubit/settings/delete_account/delete_account_cubit.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              DeleteAccountCubit(context.read<AuthenticationRepository>()),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        //TODO: sa pecom, da li je ovo optimalno?
        builder: (context, state) {
          return Scaffold(
            //TODO: sa pecom samo prokomentarisat
            // ne mijenja mi se prevod na appbar automatski
            //ovo gore mi se cini lose, da se rebuild 2 puta
            appBar: MainAppBar(title: translations.settings),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                _ChangeLanguageSettings(),
                Divider(),
                _ChangeThemeSettings(),
                Divider(),
                _LogOutSettings(),
                Divider(),
                _DeleteAccountSettings(),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DeleteAccountSettings extends StatelessWidget {
  const _DeleteAccountSettings();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountLoading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('In progress')));
        }
        if (state is DeleteAccountSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.welcomeViewScreen,
            (Route<dynamic> route) => false,
          );
        }
        if (state is DeleteAccountError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Recent logIn needed')));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                translations.deleteAccount,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (dialogContext) => AlertDialog(
                        title: Text(translations.deleteAccount),
                        content: Text(translations.confirmDeleteAccount),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            child: Text(translations.cancel),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              context
                                  .read<DeleteAccountCubit>()
                                  .deleteAccount();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            child: Text(translations.confirm),
                          ),
                        ],
                      ),
                );
              },
              icon: Icon(
                Icons.delete_forever,
                color:
                    Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).primaryColor
                        : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogOutSettings extends StatelessWidget {
  const _LogOutSettings();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              translations.logOut,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          LogoutButton(
            color:
                Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).primaryColor
                    : Colors.white,
          ),
        ],
      ),
    );
  }
}

class _ChangeThemeSettings extends StatelessWidget {
  const _ChangeThemeSettings();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              translations.changeTheme,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<ChangeThemeCubit>().toggleTheme();
            },
            icon: Icon(
              Icons.lightbulb_circle,
              size: 32,
              color:
                  Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).primaryColor
                      : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChangeLanguageSettings extends StatelessWidget {
  const _ChangeLanguageSettings();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final languageCode = state.locale.languageCode;
        final isSerbian = languageCode == 'sr';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  translations.changeLanguage,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<LanguageCubit>().changeLanguage('sr');
                },

                child: Text(
                  'SRP',
                  style: TextStyle(
                    color:
                        isSerbian
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<LanguageCubit>().changeLanguage('en');
                },
                child: Text(
                  'ENG',
                  style: TextStyle(
                    color:
                        !isSerbian
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
