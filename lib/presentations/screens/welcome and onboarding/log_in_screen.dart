import 'package:flutter/material.dart';
import 'package:my_pet/l10n/app_localizations.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: AppLocalizations.of(context)!.singIn,

        showSignOut: false,
      ),
    );
  }
}
