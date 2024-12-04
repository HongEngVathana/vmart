class Category {
  final String image;
  final String title;

  Category({required this.image, required this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      image: json['image'],
      title: json['title'],
    );
  }
}
