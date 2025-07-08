import 'package:flutter/material.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/gen/assets.gen.dart';

class WelcomeViewScreen extends StatelessWidget {
  const WelcomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.appMainPic.path),
            fit: BoxFit.cover,
          ),
        ),
        child: const SafeArea(
          child: Column(children: [AppNamePreview(), WelcomeToAppWidgets()]),
        ),
      ),
    );
  }
}

class AppNamePreview extends StatelessWidget {
  @visibleForTesting
  const AppNamePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Center(
        child: Text(
          translations.appName,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 37, 51, 40),
            letterSpacing: 6,
          ),
        ),
      ),
    );
  }
}

class WelcomeToAppWidgets extends StatelessWidget {
  @visibleForTesting
  const WelcomeToAppWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 16,
        children: [
          Text(
            translations.welcomeViewMessage,
            style: const TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            translations.welcome,
            style: const TextStyle(fontSize: 24, color: Colors.white70),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.letsStartScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              translations.welcomeButton,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),

          Image.asset(Assets.images.appLogo.path, height: 80),
        ],
      ),
    );
  }
}
