import 'package:flutter/material.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/gen/assets.gen.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class LetsStartScreen extends StatelessWidget {
  const LetsStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: translations.singInORregister,
        showSignOut: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.images.appMainPic.path,
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: const Alignment(0, -0.6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  translations.appName,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 35, 46, 37),
                    letterSpacing: 6,
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: const Alignment(0, .6),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(Routes.continueWithGoogleScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 213, 213, 225),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      Image.asset(Assets.images.googleLogo.path, height: 30),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(Routes.continueWithFacebookScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(209, 38, 38, 224),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      Image.asset(Assets.images.facebookLogo.path, height: 30),
                      const Text(
                        'Continue with Facebook',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.registerScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(179, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  label: Text(
                    translations.register,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.app_registration_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),

                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.logInScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(179, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  label: Text(
                    translations.singIn,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.login,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
