import 'package:flutter/material.dart';

import '../../../../core/res/colors/my_colors.dart';

class GoodsPage extends StatelessWidget {
  const GoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          _CancelButton()
        ],
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
