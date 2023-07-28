class Datum {
  String? idCart;
  String? idProduct;
  String? nameProduct;
  String? imageProduct;
  String? hargaSatuan;
  String? idUser;
  String? quantity;
  String? totalHarga;

  Datum({
    this.idCart,
    this.idProduct,
    this.nameProduct,
    this.imageProduct,
    this.hargaSatuan,
    this.idUser,
    this.quantity,
    this.totalHarga,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idCart: json['id_cart'] as String?,
        idProduct: json['id_product'] as String?,
        nameProduct: json['name_product'] as String?,
        imageProduct: json['image_product'] as String?,
        hargaSatuan: json['harga_satuan'] as String?,
        idUser: json['id_user'] as String?,
        quantity: json['quantity'] as String?,
        totalHarga: json['total_harga'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_cart': idCart,
        'id_product': idProduct,
        'name_product': nameProduct,
        'image_product': imageProduct,
        'harga_satuan': hargaSatuan,
        'id_user': idUser,
        'quantity': quantity,
        'total_harga': totalHarga,
      };
}
