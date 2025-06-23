import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/presentations/cubit/authentication/log_out_cubit.dart';
import 'package:my_pet/presentations/cubit/change_language/language_cubit.dart';
import 'package:my_pet/presentations/cubit/change_theme/change_theme_cubit.dart';
import 'package:my_pet/presentations/cubit/delete_account/delete_account_cubit.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';
import 'package:my_pet/l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: AppLocalizations.of(context)!.settings),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              final languageCode = state.locale.languageCode;
              final isSerbian = languageCode == 'sr';
              return _ChangeLanguageSettings(isSerbian: isSerbian);
            },
          ),
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
          ).showSnackBar(SnackBar(content: Text('Recent logIn needed')));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.deleteAccount,
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
                        title: Text(
                          AppLocalizations.of(context)!.deleteAccount,
                        ),
                        content: Text(
                          AppLocalizations.of(context)!.confirmDeleteAccount,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            child: Text(AppLocalizations.of(context)!.cancel),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(
                                dialogContext,
                              ).pop(); // prvo zatvori dijalog
                              context
                                  .read<DeleteAccountCubit>()
                                  .deleteAccount();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            child: Text(AppLocalizations.of(context)!.confirm),
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
              AppLocalizations.of(context)!.logOut,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<LogOutCubit>().logOut();
              Navigator.of(
                context,
              ).pushReplacementNamed(Routes.welcomeViewScreen);
            },
            icon: Icon(Icons.logout, color: Theme.of(context).primaryColor),
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
              AppLocalizations.of(context)!.changeTheme,
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
  const _ChangeLanguageSettings({required this.isSerbian});

  final bool isSerbian;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.changeLanguage,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<LanguageCubit>().changeLanguage('sr');
            },

            child: Text(
              'SRP',
              style: TextStyle(
                color: isSerbian ? Theme.of(context).primaryColor : Colors.grey,
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
                    !isSerbian ? Theme.of(context).primaryColor : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
