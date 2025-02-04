import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_app/core/di/dependency_injection.dart';
import 'package:malina_app/features/basket/presentation/screen/basket_page.dart';
import 'package:malina_app/features/favorites/presentation/favorites_page.dart';
import 'package:malina_app/features/feed/presentation/feed_page.dart';
import 'package:malina_app/features/food/presentation/screen/food_page.dart';
import 'package:malina_app/features/goods/presentation/screen/goods_page.dart';
import 'package:malina_app/features/profile/presentation/profile_page.dart';
import 'package:malina_app/core/res/colors/my_colors.dart';
import 'package:malina_app/features/scanner/presentation/screen/mobile_scanner_overlay.dart';

import '../../../../core/res/assets/assets.dart';
import '../../../../core/ui/widgets/bottom_bar_button.dart';
import '../cubit/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _Body(bucket: bucket),
        floatingActionButton: const FloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const _BottomAppBarWidget(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.bucket,
  });

  final PageStorageBucket bucket;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return PageStorage(bucket: bucket, child: state.currentScreen);
      },
    );
  }
}

class FloatingActionButton extends StatelessWidget {
  const FloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const MobileScannerOverlay()))
              .then((value) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FocusScope.of(context).requestFocus(FocusNode());
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Сканирован код: $value')),
            );
            if (value is String) {
              context.read<HomeCubit>().onScanCodeLoaded(value);
            }
          });
        },
        icon: SvgPicture.asset(
          Assets.icQrCode,
        ),
      ),
    );
  }
}

class _BottomAppBarWidget extends StatelessWidget {
  const _BottomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomAppBar(
          color: MyColors.kFFFFFF,
          child: SizedBox(
            height: 70,
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomBarButtonWidget(
                      isScreenCurrent: state.currentTab == 0,
                      onChanged: () => context
                          .read<HomeCubit>()
                          .onHomeScreenChanged(currentScreen: FeedPage(), currentTab: 0),
                      selectedIcon: Assets.icSelectedFeed,
                      unselectedIcon: Assets.icUnselectedFeed,
                      buttonName: 'Лента',
                    ),
                    BottomBarButtonWidget(
                      isScreenCurrent: state.currentTab == 1,
                      onChanged: () => context
                          .read<HomeCubit>()
                          .onHomeScreenChanged(currentScreen: FavoritesPage(), currentTab: 1),
                      selectedIcon: Assets.icSelectedFavorites,
                      unselectedIcon: Assets.icUnselectedFavorites,
                      buttonName: 'Избранное',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BottomBarButtonWidget(
                      isScreenCurrent: state.currentTab == 2,
                      onChanged: () => context
                          .read<HomeCubit>()
                          .onHomeScreenChanged(currentScreen: ProfilePage(), currentTab: 2),
                      selectedIcon: Assets.icSelectedProfile,
                      unselectedIcon: Assets.icUnselectedProfile,
                      buttonName: 'Профиль',
                    ),
                    MaterialButton(
                      minWidth: 60,
                      height: 60,
                      onPressed: () {
                        if (state.currentTab == 3) {
                          showGeneralDialog(
                              context: context,
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  const _CartDialog(),
                              barrierColor: Colors.transparent,
                              barrierDismissible: true,
                              barrierLabel: '');
                        }
                        context
                            .read<HomeCubit>()
                            .onHomeScreenChanged(currentScreen: BasketPage(), currentTab: 3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            state.currentTab == 3 ? Assets.icSelectedCart : Assets.icUnselectedCart,
                          ),
                          Text(
                            'Корзина',
                            style: TextStyle(
                              color: state.currentTab == 3 ? MyColors.kF72055 : MyColors.kAAAAAA,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CartDialog extends StatelessWidget {
  const _CartDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 73,
        height: 160,
        margin: const EdgeInsets.only(bottom: 60, right: 16),
        decoration: const BoxDecoration(
          color: MyColors.kFFFFFF,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FoodPage(),
                  ),
                );
              },
              icon: SvgPicture.asset(Assets.icFood),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GoodsPage(),
                  ),
                );
              },
              icon: SvgPicture.asset(Assets.icGoods),
            ),
          ],
        ),
      ),
    );
  }
}
