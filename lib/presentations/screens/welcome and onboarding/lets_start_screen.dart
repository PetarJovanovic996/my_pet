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
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/appMainPic.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const SafeArea(
          child: Column(children: [AppNamePreview(), SelectAuthOption()]),
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
          AppLocalizations.of(context)!.appName,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 35, 46, 37),
            letterSpacing: 6,
          ),
        ),
      ),
    );
  }
}

class SelectAuthOption extends StatelessWidget {
  const SelectAuthOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        spacing: 16,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.continueWithGoogleScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 213, 213, 225),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Image.asset('assets/images/googleLogo.jpg', height: 30),
                const Text(
                  "Continue with Google",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamed(Routes.continueWithFacebookScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(209, 38, 38, 224),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Image.asset('assets/images/facebookLogo.jpg', height: 30),
                const Text(
                  'Continue with Facebook',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.registerScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(179, 255, 255, 255),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            label: Text(
              AppLocalizations.of(context)!.register,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            icon: Icon(
              Icons.app_registration_rounded,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.logInScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(179, 255, 255, 255),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            label: Text(
              AppLocalizations.of(context)!.singIn,
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
    );
  }
}
