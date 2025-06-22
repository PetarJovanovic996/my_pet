import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_pet/core/app_block_observer.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/core/theme.dart';
import 'package:my_pet/data/models/language.dart';
import 'package:my_pet/core/firebase_options.dart';
import 'package:my_pet/l10n/app_localizations.dart';
import 'package:my_pet/presentations/cubit/authentication/log_out_cubit.dart';
import 'package:my_pet/presentations/cubit/change_language/language_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  const SharedPreferencesOptions sharedPreferencesOptions =
      SharedPreferencesOptions();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await migrateLegacySharedPreferencesToSharedPreferencesAsyncIfNecessary(
    legacySharedPreferencesInstance: prefs,
    sharedPreferencesAsyncOptions: sharedPreferencesOptions,
    migrationCompletedKey: 'migrationCompleted',
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authenticationRepository = AuthenticationRepository();
  final isLoggedIn = (await authenticationRepository.user.first) != User.empty;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogOutCubit(authenticationRepository),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(sharedPreferences: prefs),
        ),
      ],
      child: MyApp(
        authenticationRepository: authenticationRepository,
        isLoggedIn: isLoggedIn,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AuthenticationRepository authenticationRepository,
    this.isLoggedIn = false,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
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
            initialRoute:
                isLoggedIn ? Routes.homeScreen : Routes.welcomeViewScreen,
            onGenerateRoute: MyRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
