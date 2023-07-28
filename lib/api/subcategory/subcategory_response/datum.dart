class Datum {
  String? idSubcategory;
  String? idCategory;
  String? nameSubcategory;
  String? imageSubcategory;

  Datum({
    this.idSubcategory,
    this.idCategory,
    this.nameSubcategory,
    this.imageSubcategory,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idSubcategory: json['id_subcategory'] as String?,
        idCategory: json['id_category'] as String?,
        nameSubcategory: json['name_subcategory'] as String?,
        imageSubcategory: json['image_subcategory'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_subcategory': idSubcategory,
        'id_category': idCategory,
        'name_subcategory': nameSubcategory,
        'image_subcategory': imageSubcategory,
      };
}
