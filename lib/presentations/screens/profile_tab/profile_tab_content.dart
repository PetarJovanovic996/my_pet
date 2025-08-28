import 'package:flutter/material.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';

class ProfileTabContent extends StatelessWidget {
  const ProfileTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 24,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  //TODO: ako nema slika, onda icon, nakon dodavanja slikaaa
                  const Icon(Icons.person, size: 80),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.editProfileScreen);
                    },
                    label: Text(translations.editProfile),
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.settingsScreen);
                    },
                    icon: Icon(
                      Icons.settings_suggest_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 44,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Expanded(
          //   child: ListView.separated(
          //     separatorBuilder: (_, __) => SizedBox(height: 12),
          //     itemBuilder:
          //         (ctx, index) => Container(
          //           color: Colors.blue,
          //           child: ListTile(leading: Text("$index. broj")),
          //         ),
          //     itemCount: 50,
          //   ),
          // ),
          const Text('My posts'),
          const Text('POSTS'),
        ],
      ),
    );
  }
}
