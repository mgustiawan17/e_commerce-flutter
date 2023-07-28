import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/product/detail_product_response/data.dart';
import 'package:e_commerce/api/product/detail_product_response/detail_product_response.dart';
import 'package:e_commerce/config/login_pref.dart';
import 'package:e_commerce/screen/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  final String idProduct;
  final String nameProduct;
  final String? idCart;
  final bool update;
  const DetailProductScreen(
      {super.key,
      required this.idProduct,
      required this.nameProduct,
      this.update = false,
      this.idCart});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late Future<DetailProductResponse> detailProduct;

  getDetailProduct() {
    setState(() {
      detailProduct = Api.getDetailProduct(widget.idProduct);
      detailProduct.then((value) {
        setState(() {
          price = int.parse(value.data!.priceProduct!);
        });
      });
    });
  }

  addToCart(int qty) {
    LoginPref.getValuePref().then((value) {
      Map<String, String> data = {
        "id_user": value['id_user']!,
        "id_product": widget.idProduct,
        "quantity": qty.toString(),
      };
      Api.AddCart(data).then((value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartScreen()));
      });
    });
  }

  updateCart() {
    if (widget.idCart == null) {
      return;
    }
    LoginPref.getValuePref().then((value) {
      Map<String, String> data = {
        "quantity": quantity.toString(),
      };
      Api.UpdateCart(data, widget.idCart!, value['id_user']!).then((value) {
        Navigator.of(context).pop();
      });
    });
  }

  showProduct(Data dataProduct) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  dataProduct.imageProduct!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              dataProduct.nameProduct!,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.attach_money, size: 20),
                  ),
                  TextSpan(
                      text: dataProduct.priceProduct!,
                      style: TextStyle(color: Colors.black, fontSize: 16))
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.propane_tank_outlined, size: 20),
                  ),
                  TextSpan(
                      text: "${dataProduct.stockProduct!} Stock Available",
                      style: TextStyle(color: Colors.black, fontSize: 16))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(dataProduct.descProduct!),
          ],
        ),
      ),
    );
  }

  int quantity = 1;
  int price = 0;

  addQuantity() {
    setState(() {
      quantity += 1;
      price = quantity * price;
    });
  }

  substractQuantity() {
    if (quantity == 1) {
      return;
    }
    setState(() {
      quantity -= 1;
      price = quantity * price;
    });
  }

  @override
  void initState() {
    getDetailProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getDetailProduct();
        return Future<void>.delayed(Duration(seconds: 3));
      },
      child: Scaffold(
        appBar: AppBar(
            //?? "" = kosong
            title: Text(widget.nameProduct)),
        body: FutureBuilder(
          future: detailProduct,
          builder: (context, AsyncSnapshot<DetailProductResponse> snapshot) {
            if (snapshot.hasData) {
              price = (int.parse(snapshot.data!.data!.priceProduct!));
              return showProduct(snapshot.data!.data!);
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Terjadi Kesalahan'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //harga total + quantity
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //harga total
                  SizedBox(
                    height: 10,
                  ),
                  Text("Rp $price",
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          addQuantity();
                        },
                        icon: Icon(Icons.add),
                      ),
                      Text(
                        quantity.toString(),
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () {
                          substractQuantity();
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartScreen()));
                    },
                    child: Text("Go to Cart"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  (widget.update)
                      ? ElevatedButton(
                          onPressed: () {
                            updateCart();
                          },
                          child: Text("Update to Cart"),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            addToCart(quantity);
                          },
                          child: Text("Add to Cart"),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
