import 'package:e_commerce/api/api.dart';
// import 'package:e_commerce/api/cart/add_cart_response.dart';
import 'package:e_commerce/api/cart/list_cart_response/datum.dart';
import 'package:e_commerce/api/cart/list_cart_response/list_cart_response.dart';
import 'package:e_commerce/config/login_pref.dart';
import 'package:e_commerce/screen/detailProduct/detail_product_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<ListCartResponse> dataListCart;

  String idUser = "";

  Future<void> getlistCart() async {
    LoginPref.getValuePref().then((value) {
      print("sudah ada auth");
      setState(() {
        idUser = value['id_user']!;
        dataListCart = Api.getListCart(idUser);
      });
    });
  }

  deleteCart(String idCart) {
    Api.getDeleteCart(idCart, idUser).then((value) {
      setState(() {
        dataListCart = Api.getListCart(idUser);
      });
    });
  }

  updateCart(Map<String, String> data, idCart) {
    Api.UpdateCart(data, idCart, idUser).then((value) {
      setState(() {
        dataListCart = Api.getListCart(idUser);
      });
    });
  }

  checkout() {
    //lari ke whatsapp
  }

  @override
  void initState() {
    getlistCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: dataListCart,
            builder: (context, AsyncSnapshot<ListCartResponse> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.data!;
                return showList(data);
              }
              if (snapshot.hasError) {
                return Text("Gagal Fetching data");
              }

              return Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            // controller: noteController,
            decoration: InputDecoration(hintText: "Note..."),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Checkout"))
        ],
      ),
    );
  }

  Expanded showList(List<Datum> dataCart) {
    return Expanded(
      child: ListView.builder(
        itemCount: dataCart.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
              leading: Image.network(
                dataCart[index].imageProduct!,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              title: Text(dataCart[index].nameProduct!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Harga Satuan : Rp ${dataCart[index].hargaSatuan}"),
                  Text("Quantity : ${dataCart[index].quantity}"),
                  Text("Total : Rp ${dataCart[index].totalHarga}"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => DetailProductScreen(
                              idProduct: dataCart[index].idProduct!,
                              nameProduct: dataCart[index].nameProduct!,
                              update: true,
                              idCart: dataCart[index].idCart!,
                            ),
                          ),
                        )
                            .then((value) {
                          getlistCart();
                        });
                      },
                      child: Text("Update"))
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.highlight_remove),
                onPressed: () {
                  //lebih bagus pake alert dialog
                  deleteCart(dataCart[index].idCart!);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
