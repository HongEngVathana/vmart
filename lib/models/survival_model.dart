class SurvivalModel {
  String name;
  String image;
  String volume;
  String localCurrency;
  double localValue;
  String convertedCurrency;
  double convertedValue;
  bool addToCart;
  bool favoritte;

  SurvivalModel({
    this.name = "",
    this.image = "",
    this.volume = "",
    this.localCurrency = "",
    this.localValue = 0.00,
    this.convertedCurrency = "",
    this.convertedValue = 0.0,
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
      localCurrency: price['currency'],
      localValue: price['value'].toDouble(),
      convertedCurrency: price['converted']['currency'],
      convertedValue: price['converted']['value'].toDouble(),
      addToCart: actions['add_to_cart'],
      favoritte: actions['favorite'],
    );
  }
}
