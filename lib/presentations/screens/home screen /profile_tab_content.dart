import 'package:flutter/material.dart';

class ProfileTabContent extends StatelessWidget {
  const ProfileTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Profile pic'),
                    Text('button to see profile info'),
                  ],
                ),
                Text('settings button'),
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
