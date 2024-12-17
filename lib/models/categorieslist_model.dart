class CategorieslistModel {
  final String image;
  final title;

  CategorieslistModel({required this.image, required this.title});

  factory CategorieslistModel.fromJson(Map<String, dynamic> json) {
    return CategorieslistModel(image: json['image'], title: json['title']);
  }
}
