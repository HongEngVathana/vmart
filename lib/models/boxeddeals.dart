class Boxeddeals {
  String name;
  String image;
  String volume;
  String localCutrrency;
  double localValue;
  String covertedCurremcy;
  double convertedValue;
  bool addToCart;
  bool favorite;

  Boxeddeals({
    this.name = "",
    this.image = "",
    this.volume = "",
    this.localCutrrency = "",
    this.localValue = 0.00,
    this.covertedCurremcy = "",
    this.convertedValue = 0.00,
    this.addToCart = false,
    this.favorite = false,
  });

  factory Boxeddeals.fromJson(Map<String, dynamic> json) {
    final product = json['product'] ?? {};
    final price = product['price'] ?? {};
    final actions = product['actions'] ?? {};

    return Boxeddeals(
      name: product['name'] ?? "",
      image: product['image'] ?? "",
      volume: product['volume'] ?? "",
      localCutrrency: price['currency'] ?? "",
      localValue: (price['value'] ?? 0.0).toDouble(),
      covertedCurremcy: price['converted']?['currency'] ?? "",
      convertedValue: (price['converted']?['value'] ?? 0.0).toDouble(),
      addToCart: actions['add_to_cart'] ?? false,
      favorite: actions['favorite'] ?? false,
    );
  }
}
