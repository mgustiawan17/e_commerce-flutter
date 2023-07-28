class Data {
  String? idProduct;
  String? nameProduct;
  String? descProduct;
  String? stockProduct;
  String? priceProduct;
  String? imageProduct;
  String? idSubcategory;

  Data({
    this.idProduct,
    this.nameProduct,
    this.descProduct,
    this.stockProduct,
    this.priceProduct,
    this.imageProduct,
    this.idSubcategory,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idProduct: json['id_product'] as String?,
        nameProduct: json['name_product'] as String?,
        descProduct: json['desc_product'] as String?,
        stockProduct: json['stock_product'] as String?,
        priceProduct: json['price_product'] as String?,
        imageProduct: json['image_product'] as String?,
        idSubcategory: json['id_subcategory'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_product': idProduct,
        'name_product': nameProduct,
        'desc_product': descProduct,
        'stock_product': stockProduct,
        'price_product': priceProduct,
        'image_product': imageProduct,
        'id_subcategory': idSubcategory,
      };
}
