class CategoryModel {
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;


 const  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  CategoryModel copyWith({
    int? categoryId,
    String? categoryName,
    String? categoryImage,
  }) =>
      CategoryModel(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId.toString(),
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}