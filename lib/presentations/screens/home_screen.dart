import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pet/l10n/app_localizations.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = context.read<AuthenticationRepository>();
    final user = authRepo.currentUser;

    return Scaffold(
      appBar: MainAppBar(
        title:
            '${AppLocalizations.of(context)!.hello} ${user.name!.toUpperCase()}',
      ),
    );
  }
}
