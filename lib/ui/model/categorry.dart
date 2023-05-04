class CategoryModel {
  int id;
  String name;
  String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson({required json}) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
