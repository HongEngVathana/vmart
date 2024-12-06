class SurvivalModel {
  String name;
  String image;
  String volume;
  String currency;
  double value;
  bool addToCart;
  bool favoritte;

  SurvivalModel({
    this.name = "",
    this.image = "",
    this.volume = "",
    this.currency = "",
    this.value = 0.0,
    this.addToCart = false,
    this.favoritte = false,
  });

  factory SurvivalModel.fromJson(Map<String, dynamic> json) {
    final product = json['product'];
    final price = product['price'];
    final actions = product['actions'];
    return SurvivalModel(
      name: product['name'],
      image: product['image'],
      volume: product['volume'],
      currency: price['currency'],
      value: price['value'].toDouble(),
      addToCart: actions['add_to_cart'],
      favoritte: actions['favorite'],
    );
  }
}
