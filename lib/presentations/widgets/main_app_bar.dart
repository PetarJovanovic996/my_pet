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
          const Spacer(flex: 8),
          const LogoutButton(),
          Image.asset('assets/images/appLogo.jpg', height: 45),
          const SizedBox.shrink(),
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
