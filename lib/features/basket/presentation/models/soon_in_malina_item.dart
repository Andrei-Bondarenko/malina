import 'dart:ui';

import 'package:equatable/equatable.dart';

class SoonInMalinaItem extends Equatable{
  final String itemName;
  final Color itemColor;

  const SoonInMalinaItem({required this.itemName, required this.itemColor});

  @override
  List<Object?> get props => [itemName,itemColor];


}