import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_pet/core/app_block_observer.dart';
import 'package:my_pet/core/firebase_options.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/core/routes.dart';
import 'package:my_pet/core/theme.dart';
import 'package:my_pet/data/models/language.dart';
import 'package:my_pet/generated/l10n.dart';
import 'package:my_pet/presentations/cubit/authentication/log_out_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

import 'presentations/cubit/change_language/language_cubit.dart';
import 'presentations/cubit/change_theme/change_theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  initializeLocator();

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
          create: (context) => LanguageCubit(sharedPreferences: prefs),
        ),
        BlocProvider(create: (context) => ChangeThemeCubit()),
        BlocProvider(
          create: (context) => LogOutCubit(authenticationRepository),
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
    required AuthenticationRepository authenticationRepository,
    this.isLoggedIn = false,

    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                locale: languageState.locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales:
                    Language.supportedLanguages
                        .map((language) => language.locale)
                        .toList(),

                theme:
                    themeState.appTheme == MyThemes.light
                        ? AppTheme.lightTheme
                        : AppTheme.darkTheme,

                debugShowCheckedModeBanner: false,
                title: 'My Pet',
                initialRoute:
                    isLoggedIn ? Routes.homeScreen : Routes.welcomeViewScreen,
                onGenerateRoute: MyRouter.onGenerateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
