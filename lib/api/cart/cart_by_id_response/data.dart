class Data {
  String? idCart;
  String? nameProduct;
  String? imageProduct;
  String? idUser;
  String? quantity;

  Data({
    this.idCart,
    this.nameProduct,
    this.imageProduct,
    this.idUser,
    this.quantity,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idCart: json['id_cart'] as String?,
        nameProduct: json['name_product'] as String?,
        imageProduct: json['image_product'] as String?,
        idUser: json['id_user'] as String?,
        quantity: json['quantity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_cart': idCart,
        'name_product': nameProduct,
        'image_product': imageProduct,
        'id_user': idUser,
        'quantity': quantity,
      };
}
