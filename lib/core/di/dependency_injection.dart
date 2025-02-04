import 'package:get_it/get_it.dart';
import 'package:malina_app/features/basket/di/basket_module.dart';
import 'package:malina_app/features/home/di/home_module.dart';

final getIt = GetIt.instance;

void initDependencyInjection() {
  initHomeModule();
  initBasketModule();
}
