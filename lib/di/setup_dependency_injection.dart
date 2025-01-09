import 'package:aeig/routing/app_router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  if(!GetIt.instance.isRegistered<AppRouter>()) {
    getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  }
}