part of 'food_cubit.dart';

class FoodState extends Equatable {

  final FoodType type;

  const FoodState({required this.type});

  FoodState copyWith({
    FoodType? type,
}) {
    return FoodState(type: type ?? this.type);
  }

  @override
  List<Object?> get props => [type];
}

