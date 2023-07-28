class Datum {
  String? idProduct;
  String? nameProduct;
  String? imageProduct;
  String? priceProduct;
  String? idSubcategory;

  Datum({
    this.idProduct,
    this.nameProduct,
    this.imageProduct,
    this.priceProduct,
    this.idSubcategory,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProduct: json['id_product'] as String?,
        nameProduct: json['name_product'] as String?,
        imageProduct: json['image_product'] as String?,
        priceProduct: json['price_product'] as String?,
        idSubcategory: json['id_subcategory'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_product': idProduct,
        'name_product': nameProduct,
        'image_product': imageProduct,
        'price_product': priceProduct,
        'id_subcategory': idSubcategory,
      };
}
