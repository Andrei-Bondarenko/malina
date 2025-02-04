part of 'basket_cubit.dart';

class BasketState extends Equatable {

  final List<SoonInMalinaItem> list;

  const BasketState({
    this.list = const [
    SoonInMalinaItem(itemName: 'Вакансии', itemColor: Color.fromRGBO(212, 229, 255, 1)),
    SoonInMalinaItem(itemName: 'Маркет', itemColor: Color.fromRGBO(255, 211, 186, 1)),
    SoonInMalinaItem(itemName: 'Цветы', itemColor: Color.fromRGBO(255, 222, 222, 1)),
    SoonInMalinaItem(itemName: 'Спорт', itemColor: Color.fromRGBO(207, 242, 227, 1)),
    SoonInMalinaItem(itemName: 'Маркет', itemColor: Color.fromRGBO(189, 225, 209, 1)),
    SoonInMalinaItem(itemName: '', itemColor: Color.fromRGBO(217, 217, 217, 1)),
  ]});

  @override
  List<Object?> get props => [list];
}

