class Datum {
  String? idCategory;
  String? nameCategory;
  String? imageCategory;

  Datum({this.idCategory, this.nameCategory, this.imageCategory});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idCategory: json['id_category'] as String?,
        nameCategory: json['name_category'] as String?,
        imageCategory: json['image_category'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_category': idCategory,
        'name_category': nameCategory,
        'image_category': imageCategory,
      };
}
