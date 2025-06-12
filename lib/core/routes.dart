import 'package:flutter/material.dart';
import 'package:my_pet/presentations/screens/welcome_view_screen.dart';

class Routes {
  static const String welcomeViewScreen = 'welcome-view';
  static const String logInScreen = 'logIn-screen';
  static const String registerScreen = 'register-screen';
  static const String onboardingScreen = 'onboarding-screen';
  static const String homeScreen = 'home-screen';
  static const String editProfileScreen = 'edit-profile-screen';
}

class MyRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return switch (routeSettings.name) {
          (Routes.welcomeViewScreen) => const WelcomeViewScreen(),
          //   (Routes.logInScreen) => const LogInScreen(),
          // (Routes.registerScreen) => const RegisterScreen(),
          // (Routes.onboardingScreen) => const OnboardingScreen(),
          // (Routes.homeScreen) => const HomeScreen(),
          // (Routes.editProfileScreen) => const EditProfileScreen(),

          // Default route
          _ => const WelcomeViewScreen(),
        };
      },
    );
  }
}
