import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_first_task/products_model.dart';

class ApiProvider {
  final String baseUrl = "https://dummyjson.com";

  ProductsModel? productsModel;

  Future<ProductsModel?> getProducts() async {
    try {
      Response response = await Dio().get("$baseUrl/products");
      print("API Response: ${response.data}");
      print("Status Code: ${response.statusCode}");
      productsModel = ProductsModel.fromJson(response.data);
      print("Product Title: ${productsModel?.products[1].title}");
      return productsModel;
    } catch (e) {
      print("Error: $e");
    }
  }
}
