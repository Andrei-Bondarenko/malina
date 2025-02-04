import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/res/colors/my_colors.dart';
import '../cubit/basket_cubit.dart';

class MalinaListTitle extends StatelessWidget {
  const MalinaListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20),
      child: const Text(
        'Скоро в Malina',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: MyColors.k000000,
        ),
      ),
    );
  }
}

class MalinaList extends StatelessWidget {
  const MalinaList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(
      builder: (context, state) {
        return Container(
          height: 86,
          margin: const EdgeInsets.only(top: 8, left: 20),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
            ),
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              return Container(
                width: 86,
                height: 86,
                padding: const EdgeInsets.only(top: 58),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: state.list[index].itemColor,
                ),
                child: Text(
                  state.list[index].itemName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: MyColors.k121212,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}