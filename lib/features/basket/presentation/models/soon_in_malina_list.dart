import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:malina_app/core/res/colors/my_colors.dart';
import 'package:malina_app/features/basket/presentation/models/soon_in_malina_item.dart';

class SoonInMalinaList extends Equatable {
  final List<SoonInMalinaItem> itemsList = [
    const SoonInMalinaItem(itemName: 'Вакансии', itemColor: MyColors.kD4E5FF),
    const SoonInMalinaItem(itemName: 'Маркет', itemColor: MyColors.kFFD3BA),
    const SoonInMalinaItem(itemName: 'Цветы', itemColor: MyColors.kFFDEDE),
    const SoonInMalinaItem(itemName: 'Спорт', itemColor: MyColors.kCFF2E3),
    const SoonInMalinaItem(itemName: 'Маркет', itemColor: MyColors.kBDE1D1),
    const SoonInMalinaItem(itemName: '', itemColor: MyColors.kD9D9D9),
  ];

  @override
  List<Object?> get props => [itemsList];
}
