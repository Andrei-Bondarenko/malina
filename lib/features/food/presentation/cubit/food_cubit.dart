import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/features/food/presentation/models/food_type.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(const FoodState(type: FoodType.delivery));

  void onTypeChanged(FoodType type) {
    emit(state.copyWith(type: type));
  }

}
