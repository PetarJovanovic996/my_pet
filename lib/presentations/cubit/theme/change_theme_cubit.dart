import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(const ChangeThemeState(MyThemes.light)) {
    _loadTheme();
  }

  void toggleTheme() async {
    final newTheme =
        state.appTheme == MyThemes.light ? MyThemes.dark : MyThemes.light;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', newTheme.toString());

    emit(ChangeThemeState(newTheme));
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('theme');

    if (themeString != null) {
      final theme =
          themeString == MyThemes.dark.toString()
              ? MyThemes.dark
              : MyThemes.light;
      emit(ChangeThemeState(theme));
    } else {
      emit(const ChangeThemeState(MyThemes.light));
    }
  }
}
