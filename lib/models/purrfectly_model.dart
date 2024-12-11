class PurrfectlyModel {
  final String name;
  final String image;
  final String volume;
  final String localCurrency;
  final String convertedCurrency;
  final double value;
  final String khmerValue;
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
    final product = json['product'] as Map<String, dynamic>? ?? {};
    final price = product['price'] as Map<String, dynamic>? ?? {};
    final actions = product['actions'] as Map<String, dynamic>? ?? {};
    return PurrfectlyModel(
      name: product['name'] ?? "",
      image: product['image'] ?? "",
      volume: product['volume'] ?? "",
      localCurrency: price['currency'] ?? "",
      convertedCurrency: price['converted']?['currency'] ?? "",
      value: (price['value'] as num?)?.toDouble() ?? 0.00,
      khmerValue: price['khmer_value'] ?? "",
      addToCart: actions['add_to_cart'] ?? false,
      favorite: actions['favorite'] ?? false,
    );
  }
}
