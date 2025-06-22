import 'package:flutter/material.dart';
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
          ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(
              AppLocalizations.of(context)!.changeLanguage,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('SRP'),
                SizedBox(width: 8),
                Switch(
                  value: false, //TODO: impl trenutno stanje
                  onChanged: (_) {}, //impl promjenu jezika
                  activeColor: Theme.of(context).primaryColor,
                  inactiveThumbColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Theme.of(
                    context,
                  ).primaryColor.withAlpha(100),
                ),
                SizedBox(width: 8),
                Text('ENG'),
              ],
            ),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(
              AppLocalizations.of(context)!.changeTheme,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocalizations.of(context)!.light),
                SizedBox(width: 8),
                Switch(
                  value: true, //TODO: impl trenutno stanje
                  onChanged: (_) {}, //impl promjenu teme
                  activeColor: Theme.of(context).primaryColor,
                  inactiveThumbColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Theme.of(
                    context,
                  ).primaryColor.withAlpha(100),
                ),
                SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.dark),
              ],
            ),
          ),
          Divider(),

          ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(
              AppLocalizations.of(context)!.logOut,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: LogoutButton(),
          ),
          Divider(),

          ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(
              AppLocalizations.of(context)!.deleteAccount,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_forever),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
