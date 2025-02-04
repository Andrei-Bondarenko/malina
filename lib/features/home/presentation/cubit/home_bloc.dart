import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/features/basket/presentation/screen/basket_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(currentScreen: BasketPage()));

  void onHomeScreenChanged({
    required Widget currentScreen,
    required int currentTab,
  }) {
    emit(state.copyWith(currentScreen: currentScreen, currentTab: currentTab));
  }

  void onScanCodeLoaded(String scanCode) {
    emit(state.copyWith(scanCode: scanCode));
  }
}
