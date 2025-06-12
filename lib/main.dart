import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_pet/core/app_block_observer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/data/models/language.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:
          Language.supportedLanguages
              .map((language) => language.locale)
              .toList(),

      //dodati temu
      debugShowCheckedModeBanner: false,
      title: 'My Pet',
      onGenerateRoute: MyRouter.onGenerateRoute,
    );
  }
}
