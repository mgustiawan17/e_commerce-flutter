import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/category/category_response/category_response.dart'
    as Category;
import 'package:e_commerce/api/category/category_response/datum.dart'
    as Category;
import 'package:e_commerce/api/product/product_response/product_response.dart'
    as Product;
import 'package:e_commerce/api/product/product_response/datum.dart' as Product;
import 'package:e_commerce/config/login_pref.dart';
import 'package:e_commerce/screen/detailProduct/detail_product_screen.dart';
import 'package:e_commerce/screen/subcategory/subcategory_screen.dart';
import 'package:flutter/material.dart';

class HomeSubScreen extends StatefulWidget {
  const HomeSubScreen({super.key});

  @override
  State<HomeSubScreen> createState() => _HomeSubScreenState();
}

class _HomeSubScreenState extends State<HomeSubScreen> {
  Map<String, String>? dataUser;

  late Future<Category.CategoryResponse> listCategory;
  late Future<Product.ProductResponse> listProduct;

  getListProduct() {
    setState(() {
      listProduct = Api.getListProduct();
    });
  }

  getListCategory() {
    setState(() {
      listCategory = Api.getListCategory();
    });
  }

  Widget itemProduct(Product.Datum dataProduct) {
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

  Widget itemCategory(Category.Datum dataCategory) {
    return GestureDetector(
      onTap: () {
        //pindah ke halaman subcategory dan kirim data id dan nama kategori
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SubcategoryScreen(
              idCategory: dataCategory.idCategory!,
              nameCategory: dataCategory.nameCategory!,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        width: 170,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.network(
                dataCategory.imageCategory!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x909090),
                        Color(0xCF272727),
                      ]),
                ),
              ),
              Center(
                child: Text(
                  dataCategory.nameCategory!,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    LoginPref.getValuePref().then((value) {
      setState(() {
        dataUser = value;
      });
    });
    getListCategory();
    getListProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getListCategory();
        getListProduct();
        return Future<void>.delayed(Duration(seconds: 3));
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("E-Commerce"),
          ),
          body: Column(
            children: [
              //list category
              SizedBox(
                height: 100,
                child: FutureBuilder(
                  future: listCategory,
                  builder: (context,
                      AsyncSnapshot<Category.CategoryResponse> snapshot) {
                    //jika hasil request api menghasilkan data maka tampilkan list data category
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.data![index];
                          return itemCategory(data);
                        },
                      );
                    }
                    if (snapshot.hasError) {
                      return Text("Gagal Fetching data");
                    }

                    //ini untuk loadingnya
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              FutureBuilder(
                future: listProduct,
                builder:
                    (context, AsyncSnapshot<Product.ProductResponse> snapshot) {
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

                  return Center(child: CircularProgressIndicator());
                },
              )
            ],
          )
          // Center(
          //   child: (dataUser != null)
          //       ? Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text("ID User : ${dataUser!['id_user']}"),
          //             Text("Username : ${dataUser!['username']}"),
          //           ],
          //         )
          //       : CircularProgressIndicator(),
          // ),
          ),
    );
  }
}
