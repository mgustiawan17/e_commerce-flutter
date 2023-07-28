class Datum {
  String? idProduct;
  String? nameProduct;
  String? priceProduct;
  String? imageProduct;
  String? idSubcategory;

  Datum({
    this.idProduct,
    this.nameProduct,
    this.priceProduct,
    this.imageProduct,
    this.idSubcategory,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProduct: json['id_product'] as String?,
        nameProduct: json['name_product'] as String?,
        priceProduct: json['price_product'] as String?,
        imageProduct: json['image_product'] as String?,
        idSubcategory: json['id_subcategory'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_product': idProduct,
        'name_product': nameProduct,
        'price_product': priceProduct,
        'image_product': imageProduct,
        'id_subcategory': idSubcategory,
      };
}
