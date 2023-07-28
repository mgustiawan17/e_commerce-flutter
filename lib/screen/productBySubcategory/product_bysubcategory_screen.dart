import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/productBySubcategory/list_product_by_subcategory/datum.dart';
import 'package:e_commerce/api/productBySubcategory/list_product_by_subcategory/list_product_by_subcategory.dart';
import 'package:e_commerce/screen/detailProduct/detail_product_screen.dart';
import 'package:flutter/material.dart';

class ProductBySubcategoryScreen extends StatefulWidget {
  final String idSubcategory;
  final String nameSubcategory;
  const ProductBySubcategoryScreen(
      {super.key, required this.idSubcategory, required this.nameSubcategory});

  @override
  State<ProductBySubcategoryScreen> createState() =>
      _ProductBySubcategoryScreenState();
}

class _ProductBySubcategoryScreenState
    extends State<ProductBySubcategoryScreen> {
  late Future<ListProductBySubcategory> listProduct;

  getProduct() {
    setState(() {
      listProduct = Api.getListProductBySubcategory(widget.idSubcategory);
    });
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  Widget itemProduct(Datum dataProduct) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailProductScreen(
              idProduct: dataProduct.idProduct!,
              nameProduct: dataProduct.nameProduct!,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 50,
        margin: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                dataProduct.imageProduct!,
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              dataProduct.nameProduct!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              dataProduct.priceProduct!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getProduct();
        return Future<void>.delayed(Duration(seconds: 3));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.nameSubcategory),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: listProduct,
              builder:
                  (context, AsyncSnapshot<ListProductBySubcategory> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.data!;
                  return Expanded(
                    child: GridView.builder(
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return itemProduct(data[index]);
                      },
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text("Gagal Fetching data");
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
