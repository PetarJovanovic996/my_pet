import 'package:flutter/material.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/gen/assets.gen.dart';

class WelcomeViewScreen extends StatelessWidget {
  const WelcomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              // TODO: Refactor assets;
              // 'assets/images/appMainPic.jpg',
              Assets.images.appMainPic.path,
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment(0, -0.6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  translations.appName,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 35, 46, 37),
                    letterSpacing: 6,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    translations.welcomeViewMessage,
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    translations.welcome,
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.letsStartScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      translations.welcomeButton,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),

                  Image.asset('assets/images/appLogo.jpg', height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
