import 'package:flutter/material.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/l10n/app_localizations.dart';

class ProfileTabContent extends StatelessWidget {
  const ProfileTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-1, -0.9),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //TODO: dodati sliku user/a
                Icon(Icons.person, size: 80),
                SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.userInfoScreen);
                  },
                  label: Text(AppLocalizations.of(context)!.editProfile),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.9, -0.9),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.settingsScreen);
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),
                Text(AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, -0.2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text('My posts'), Text('POSTS')],
            ),
          ),
        ],
      ),
    );
  }
}
