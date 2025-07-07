part of 'change_theme_cubit.dart';

enum MyThemes { light, dark }

class ChangeThemeState extends Equatable {
  const ChangeThemeState(this.appTheme);

  final MyThemes appTheme;

  @override
  List<Object> get props => [appTheme];
}
