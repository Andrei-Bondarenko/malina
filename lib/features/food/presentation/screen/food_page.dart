import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/core/res/colors/my_colors.dart';
import 'package:malina_app/features/food/presentation/cubit/food_cubit.dart';
import 'package:malina_app/features/food/presentation/models/food_type.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(),
      child: Scaffold(
        backgroundColor: MyColors.kF8F8F8,
        appBar: AppBar(
          backgroundColor: MyColors.kF8F8F8,
          title: const Text(
            'Корзина',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          actions: const [
            _CancelButton(),
          ],
        ),
        body: const _Body(),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Очистить',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: MyColors.k1D1D1D),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final foodType = context.select((FoodCubit cubit) => cubit.state.type);
    return SingleChildScrollView(
      child: Column(
        children: [
          _TagsRow(selectedType: foodType),
          if (foodType == FoodType.delivery) const _DeliveryBody() else const _InStockBody(),
        ],
      ),
    );
  }
}

class _TagsRow extends StatelessWidget {
  const _TagsRow({super.key, required this.selectedType});

  final FoodType selectedType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var type in FoodType.values) ...[
            _TagWidget(type: type, isSelected: type == selectedType),
            const SizedBox(width: 8),
          ]
        ],
      ),
    );
  }
}

class _DeliveryBody extends StatelessWidget {
  const _DeliveryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('DELIVERY'),
    );
  }
}

class _InStockBody extends StatelessWidget {
  const _InStockBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('IN STOCK'),
    );
  }
}

class _TagWidget extends StatelessWidget {
  const _TagWidget({super.key, required this.type, required this.isSelected});

  final FoodType type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FoodCubit>().onTypeChanged(type);
      },
      splashColor: MyColors.kF72055,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 40,
        width: 165,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.transparent : MyColors.kEDEBEB),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? MyColors.kF72055 : MyColors.kFFFFFF.withOpacity(0),
        ),
        child: Center(
          child: Text(
            type.getTitle(),
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? MyColors.kFFFFFF : MyColors.k353535,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
