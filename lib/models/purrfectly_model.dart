class PurrfectlyModel {
  String name;
  String image;
  String volume;
  String localCurrency;
  String convertedCurrency;
  double value;
  String khmerValue;
  bool addToCart;
  bool favorite;

  PurrfectlyModel({
    this.name = "",
    this.image = "",
    this.volume = "",
    this.localCurrency = "",
    this.convertedCurrency = "",
    this.value = 0.00,
    this.khmerValue = "",
    this.addToCart = false,
    this.favorite = false,
  });

  factory PurrfectlyModel.fromJson(Map<String, dynamic> json) {
    final product = json['product'];
    final price = product['price'];
    final actions = product['actions'];
    return PurrfectlyModel(
      name: product['name'] ?? "",
      image: product['image'] ?? "",
      volume: product['volume'] ?? "",
      localCurrency: price['currency'] ?? "",
      convertedCurrency: price['converted']['currency'] ?? "",
      value: (price['value'] as num?)?.toDouble() ?? 0.00,
      khmerValue: price['khmer_value'] ?? "",
      addToCart: actions['add_to_cart'] ?? false,
      favorite: actions['favorite'] ?? false,
    );
  }
}
