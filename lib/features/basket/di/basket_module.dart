import 'package:malina_app/core/di/dependency_injection.dart';

import '../presentation/cubit/basket_cubit.dart';

void initBasketModule() {
  getIt.registerFactory(() => BasketCubit());
}
