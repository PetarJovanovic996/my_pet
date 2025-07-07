import 'package:flutter/material.dart';
import 'package:my_pet/presentations/screens/home_screen.dart';
import 'package:my_pet/presentations/screens/profile_tab/settings_screen.dart';
import 'package:my_pet/presentations/screens/profile_tab/edit_profile_screen.dart';
import 'package:my_pet/presentations/screens/welcome%20and%20onboarding/continue_with_facebook_screen.dart';
import 'package:my_pet/presentations/screens/welcome%20and%20onboarding/continue_with_google_screen.dart';
import 'package:my_pet/presentations/screens/welcome%20and%20onboarding/lets_start_screen.dart';
import 'package:my_pet/presentations/screens/welcome%20and%20onboarding/sign_in_screen.dart';
import 'package:my_pet/presentations/screens/welcome%20and%20onboarding/register_screen.dart';
import 'package:my_pet/presentations/screens/welcome%20and%20onboarding/welcome_view_screen.dart';

class Routes {
  static const String welcomeViewScreen = 'welcome-view-screen';
  static const String letsStartScreen = 'lets-start-screen';

  static const String logInScreen = 'logIn-screen';
  static const String registerScreen = 'register-screen';
  static const String continueWithGoogleScreen = 'continue-with-google-screen';
  static const String continueWithFacebookScreen =
      'continue-with-facebook-screen';
  static const String homeScreen = 'home-screen';
  static const String settingsScreen = 'settings-screen';
  static const String editProfileScreen = 'edit-profile-screen';
}

class MyRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return switch (routeSettings.name) {
          (Routes.welcomeViewScreen) => const WelcomeViewScreen(),
          (Routes.letsStartScreen) => const LetsStartScreen(),

          (Routes.logInScreen) => const SignInScreen(),
          (Routes.registerScreen) => const RegisterScreen(),
          (Routes.continueWithFacebookScreen) =>
            const ContinueWithFacebookScreen(),

          (Routes.continueWithGoogleScreen) => const ContinueWithGoogleScreen(),
          (Routes.settingsScreen) => const SettingsScreen(),

          (Routes.editProfileScreen) => const EditProfileScreen(),

          (Routes.homeScreen) => const HomeScreen(),

          // Default route
          _ => const WelcomeViewScreen(),
        };
      },
    );
  }
}
