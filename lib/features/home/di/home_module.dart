import 'package:malina_app/core/di/dependency_injection.dart';

import '../presentation/cubit/home_bloc.dart';

void initHomeModule() {
  getIt.registerFactory(() => HomeCubit());
}
