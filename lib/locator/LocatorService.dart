import 'package:Sporten_in_de_buurt/http/HttpService.dart';
import 'package:get_it/get_it.dart';

final _locator = GetIt.instance;

class LocatorService {
  /// Initialise all required dependencies.
  void init() {
    _locator.registerLazySingleton<HttpService>(() => HttpService());
  }

  static T locate<T>() => _locator.get<T>();
}