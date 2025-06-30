import 'package:flutter/material.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/l10n/app_localizations.dart';

class WelcomeViewScreen extends StatelessWidget {
  const WelcomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeViewWrapper(
      children: [WelcomeViewAppName(), WelcomeViewActionButtons()],
    );
  }
}

class WelcomeViewWrapper extends StatelessWidget {
  const WelcomeViewWrapper({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            // TODO: pub.dev/flutter_gen package dodati za assete
            // TODO: Istraziti lokator za prevode iz MyTurna, odnosno [translations] u [locator.dart]
            //TODO: srediti sve prevode - (Hard code text)
            image: AssetImage('assets/images/appMainPic.jpg'),
          ),
        ),
        child: SafeArea(child: Column(children: children)),
      ),
    );
  }
}

class WelcomeViewAppName extends StatelessWidget {
  @visibleForTesting
  const WelcomeViewAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
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

class WelcomeViewActionButtons extends StatelessWidget {
  const WelcomeViewActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 16,
        children: [
          Text(
            AppLocalizations.of(context)!.welcomeViewMessage,
            style: const TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            AppLocalizations.of(context)!.welcome,
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
              AppLocalizations.of(context)!.welcomeButton,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Image.asset('assets/images/appLogo.jpg', height: 80),
        ],
      ),
    );
  }
}
