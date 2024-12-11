class FreshpickModel {
  final String name;
  final String image;
  final String volume;
  final bool favorite;
  bool addToCart;
  final double localValue;
  final String localCurrency;
  final double convertedValue;
  final String convertedCurrency;

  FreshpickModel({
    required this.name,
    required this.image,
    required this.volume,
    required this.favorite,
    required this.addToCart,
    required this.localValue,
    required this.localCurrency,
    required this.convertedValue,
    required this.convertedCurrency,
  });

  factory FreshpickModel.fromJson(Map<String, dynamic> json) {
    return FreshpickModel(
      name: json['name'],
      image: json['image'],
      volume: json['volume'],
      favorite: json['favorite'],
      addToCart: json['addToCart'],
      localValue: json['localValue'],
      localCurrency: json['localCurrency'],
      convertedValue: json['convertedValue'],
      convertedCurrency: json['convertedCurrency'],
    );
  }
}
