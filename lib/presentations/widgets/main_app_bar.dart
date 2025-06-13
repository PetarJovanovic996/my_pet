import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title, this.showSignOut = true});
  final String title;
  final bool showSignOut;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(title),
          const Spacer(flex: 8),
          const LogoutButton(),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LogoutButton extends StatelessWidget {
  @visibleForTesting
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.logout));
  }
}
