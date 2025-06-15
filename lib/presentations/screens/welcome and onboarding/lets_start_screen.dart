import 'package:flutter/material.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';
import 'package:my_pet/l10n/app_localizations.dart';

class LetsStartScreen extends StatelessWidget {
  const LetsStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: AppLocalizations.of(context)!.singInORregister,
        showSignOut: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/hello.jpg', fit: BoxFit.cover),
          ),

          Align(
            alignment: Alignment(0, -0.6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.appName,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 35, 46, 37),
                    letterSpacing: 6,
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment(0, .6),

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
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      Image.asset('assets/images/googleLogo.jpg', height: 30),
                      Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(Routes.continueWithFacebookScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(217, 38, 38, 224),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      Image.asset('assets/images/facebookLogo.jpg', height: 30),
                      Text(
                        'Continue with Facebook',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.registerScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(179, 255, 255, 255),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.register,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.app_registration_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),

                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.logInScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(179, 255, 255, 255),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.singIn,
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
