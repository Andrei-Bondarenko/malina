part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Widget currentScreen;
  final int currentTab;
  final String scanCode;

  const HomeState({
    required this.currentScreen,
    this.currentTab = 3,
    this.scanCode = '',
  });

  HomeState copyWith({
    int? currentTab,
    Widget? currentScreen,
    String? scanCode,
  }) {
    return HomeState(
      currentScreen: currentScreen ?? this.currentScreen,
      currentTab: currentTab ?? this.currentTab,
      scanCode: scanCode ?? this.scanCode,
    );
  }

  @override
  List<Object?> get props =>
      [
        currentTab,
        currentScreen,
        scanCode,
      ];
}
