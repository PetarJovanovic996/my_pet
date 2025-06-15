// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get hello => 'Zdravo';

  @override
  String get welcome => 'Dobrodošli u aplikaciju!';

  @override
  String get welcomeButton => 'Zapocni';

  @override
  String get appName => 'MY PET';

  @override
  String get welcomeViewMessage => 'ZA VAS I VASEG PRIJATELJA';

  @override
  String get singInORregister => 'Registruj se / Prijavi se';

  @override
  String get singIn => 'Prijavi se';

  @override
  String get register => 'Registruj se';
}
