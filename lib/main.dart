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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authenticationRepository = AuthenticationRepository();
  final isLoggedIn = (await authenticationRepository.user.first) != User.empty;

  runApp(
    BlocProvider(
      create: (context) => LogOutCubit(AuthenticationRepository()),
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
      child: MaterialApp(
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
        initialRoute: isLoggedIn ? Routes.homeScreen : Routes.welcomeViewScreen,
        onGenerateRoute: MyRouter.onGenerateRoute,
      ),
    );
  }
}
