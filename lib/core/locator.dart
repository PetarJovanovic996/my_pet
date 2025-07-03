import 'package:get_it/get_it.dart';
import 'package:my_pet/generated/l10n.dart';

final locator = GetIt.instance;
final translations = locator<S>();

void initializeLocator() {
  // Translation labels
  locator.registerSingleton<S>(S());

  // locator.registerSingleton<Type>(Object());

  // locator.registerLazySingleton<S>(() => S());
}
