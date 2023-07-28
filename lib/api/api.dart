import 'dart:convert';

import 'package:e_commerce/api/cart/add_cart_response.dart';
import 'package:e_commerce/api/cart/cart_by_id_response/cart_by_id_response.dart';
import 'package:e_commerce/api/cart/delete_cart_response.dart';
import 'package:e_commerce/api/cart/list_cart_response/list_cart_response.dart';
import 'package:e_commerce/api/cart/update_cart_response.dart';
import 'package:e_commerce/api/category/category_response/category_response.dart';
import 'package:e_commerce/api/login_response/login_response.dart';
import 'package:e_commerce/api/product/detail_product_response/detail_product_response.dart';
import 'package:e_commerce/api/product/product_response/product_response.dart';
import 'package:e_commerce/api/productBySubcategory/list_product_by_subcategory/list_product_by_subcategory.dart';
import 'package:e_commerce/api/register_response.dart';
import 'package:e_commerce/api/subcategory/subcategory_response/subcategory_response.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "http://192.168.18.196/backend-ci-ecommerce/api/";

class Api {
  static Future<LoginResponse> login(String email, String password) async {
    String url = BASE_URL + "AuthUser/login";
    Map<String, String> data = {
      "email": email,
      "password": password,
    };
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.post(Uri.parse(url), body: data);

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to login";
  }

  static Future<RegisterResponse> register(Map<String, String> data) async {
    String url = BASE_URL + "AuthUser/register";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.post(Uri.parse(url), body: data);

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to register";
  }

  //category
  static Future<CategoryResponse> getListCategory() async {
    String url = BASE_URL + "Category/listCategory";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return CategoryResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch list Category";
  }

  //product
  static Future<ProductResponse> getListProduct() async {
    String url = BASE_URL + "Product/listProduct";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch list Product";
  }

  //subcategory
  static Future<SubcategoryResponse> getListSubcategory(
      String idCategory) async {
    String url = BASE_URL + "Subcategory/listSubcategory/$idCategory";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return SubcategoryResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch list Subcategory";
  }

  //product by subcategory
  static Future<ListProductBySubcategory> getListProductBySubcategory(
      String idSubcategory) async {
    String url =
        BASE_URL + "Subcategory/listProductBySubcategory/$idSubcategory";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return ListProductBySubcategory.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch list Product By Subcategory";
  }

  static Future<DetailProductResponse> getDetailProduct(
      String idProduct) async {
    String url = BASE_URL + "Product/detailProduct/$idProduct";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return DetailProductResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch detail Product";
  }

  // CART
  static Future<ListCartResponse> getListCart(String idUser) async {
    String url = BASE_URL + "Cart/listCart/$idUser";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return ListCartResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch list Cart";
  }

  static Future<CartByIdResponse> getCartById(
      String idUser, String idCart) async {
    String url = BASE_URL + "Cart/cartById/$idUser/$idCart";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return CartByIdResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch Cart By ID";
  }

  static Future<AddCartResponse> AddCart(Map<String, String> data) async {
    String url = BASE_URL + "Cart/add";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.post(Uri.parse(url), body: data);

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return AddCartResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch Add Cart ";
  }

  static Future<UpdateCartResponse> UpdateCart(
      Map<String, String> data, String idCart, String idUser) async {
    String url = BASE_URL + "Cart/update/$idCart/$idUser";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.post(Uri.parse(url), body: data);

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return UpdateCartResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch Update Cart ";
  }

  static Future<DeleteCartResponse> getDeleteCart(
      String idCart, String idUser) async {
    String url = BASE_URL + "Cart/delete/$idCart/$idUser";
    //melakukan request dengan method get
    //await = proses selanjutnya akan dijeda sampai proses request selessai
    final response = await http.get(Uri.parse(url));

    //cek jika status code 200, maka kembalikan data list berita
    if (response.statusCode == 200) {
      return DeleteCartResponse.fromJson(jsonDecode(response.body));
    }

    //jika tidak, maka lempar exception berupa pesan error
    throw "Unable to fetch Delete Cart ";
  }
}
