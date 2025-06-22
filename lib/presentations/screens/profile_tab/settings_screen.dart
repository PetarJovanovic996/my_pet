import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/presentations/cubit/authentication/log_out_cubit.dart';
import 'package:my_pet/presentations/cubit/change_language/language_cubit.dart';
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

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.changeLanguage,
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
          ),

          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.changeTheme,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {}, //TODO: implementirati toogletheme

                  icon: Icon(
                    Icons.lightbulb_circle,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                    //TODO: color primary ako je dark
                    //Color grey ako je light
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.logOut,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<LogOutCubit>().logOut();
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(Routes.welcomeViewScreen);
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),

          Divider(),

          Padding(
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
                  onPressed: () {}, //TODO: delete account to implement
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.grey,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),

          Divider(),
        ],
      ),
    );
  }
}
