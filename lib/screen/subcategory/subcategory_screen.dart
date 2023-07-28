import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/subcategory/subcategory_response/datum.dart';
import 'package:e_commerce/api/subcategory/subcategory_response/subcategory_response.dart';
import 'package:e_commerce/screen/productBySubcategory/product_bysubcategory_screen.dart';
import 'package:flutter/material.dart';

class SubcategoryScreen extends StatefulWidget {
  final String idCategory;
  final String nameCategory;
  const SubcategoryScreen(
      {super.key, required this.idCategory, required this.nameCategory});

  @override
  State<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  late Future<SubcategoryResponse> listSubcategory;

  getsubcategory() {
    setState(() {
      listSubcategory = Api.getListSubcategory(widget.idCategory);
    });
  }

  @override
  void initState() {
    getsubcategory();
    super.initState();
  }

  Widget itemSubcategory(Datum dataSubcategory) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductBySubcategoryScreen(
              idSubcategory: dataSubcategory.idSubcategory!,
              nameSubcategory: dataSubcategory.nameSubcategory!,
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
                dataSubcategory.imageSubcategory!,
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
                  dataSubcategory.nameSubcategory!,
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
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getsubcategory();
        return Future<void>.delayed(Duration(seconds: 3));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.nameCategory),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: listSubcategory,
              builder: (context, AsyncSnapshot<SubcategoryResponse> snapshot) {
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
                        return itemSubcategory(data[index]);
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
