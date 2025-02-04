enum FoodType {
  delivery,
  inStock;

  const FoodType();

  String getTitle() {
    return switch (this) {
      FoodType.delivery => 'Доставка',
      FoodType.inStock => 'В заведении',
    };
  }

  static FoodType from(String type) {
    return switch (type) {
      'Доставка' => FoodType.delivery,
      'В заведении' => FoodType.inStock,
      _ => FoodType.delivery
    };
  }
}
