import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_app/core/res/assets/assets.dart';
import 'package:malina_app/core/res/colors/my_colors.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/basket_cubit.dart';
import 'malina_list.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BasketCubit>(),
      child: const Scaffold(
        backgroundColor: MyColors.kF8F8F8,
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.only(right: 12, left: 6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SearchWidget(),
                _QrCodeImage(),
                _FoodImage(),
                _BeautyImage(),
                MalinaListTitle(),
                MalinaList(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 52, left: 20),
      width: 350,
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Image.asset(Assets.icSearch),
          filled: true,
          fillColor: MyColors.kFFFFFF,
          hintText: 'Искать в Malina',
          hintStyle: const TextStyle(color: MyColors.k828282, fontSize: 14),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _QrCodeImage extends StatelessWidget {
  const _QrCodeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14, left: 20),
      child: SvgPicture.asset(
        Assets.imgQrCode,
        width: 350,
        height: 90,
      ),
    );
  }
}

class _FoodImage extends StatelessWidget {
  const _FoodImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(
            Assets.imgFood,
          ),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 18, left: 16),
            child: const Text(
              'Еда',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: MyColors.k000000,
              ),
            ),
          ),
          Container(
            width: 100,
            margin: const EdgeInsets.only(top: 50, left: 17),
            child: const Text(
              'Из кафе и \nресторанов',
              style: TextStyle(
                color: MyColors.k000000,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BeautyImage extends StatelessWidget {
  const _BeautyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 170,
      margin: const EdgeInsets.only(top: 20, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.kFFDEDD,
        image: const DecorationImage(
          image: AssetImage(
            Assets.imgBeauty,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 18, left: 16),
            child: const Text(
              'Бьюти',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: 130,
            margin: const EdgeInsets.only(top: 50, left: 17),
            child: const Text(
              'Салоны красоты \nи товары',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
