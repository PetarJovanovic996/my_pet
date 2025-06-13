import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_pet/core/app_block_observer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/core/theme.dart';
import 'package:my_pet/data/models/language.dart';
import 'package:my_pet/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  const SharedPreferencesOptions sharedPreferencesOptions =
      SharedPreferencesOptions();
  final sharedPreferences = await SharedPreferences.getInstance();
  await migrateLegacySharedPreferencesToSharedPreferencesAsyncIfNecessary(
    legacySharedPreferencesInstance: sharedPreferences,
    sharedPreferencesAsyncOptions: sharedPreferencesOptions,
    migrationCompletedKey: 'migrationCompleted',
  );

  //TODO: shared preference iskopiran iz proslog koda!
  //provjera i pojasnjenje

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,
      title: 'My Pet',
      onGenerateRoute: MyRouter.onGenerateRoute,
    );
  }
}
