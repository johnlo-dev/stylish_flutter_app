import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants.dart';
import '../model/product.dart';
import 'api_response.dart';

abstract class IProductRepository {
  Future<ProductListResponse> fetchProductList(CategoryType type);
}

class ProductRepository extends IProductRepository {
  @override
  Future<ProductListResponse> fetchProductList(CategoryType type) async {
    Dio dio = Dio();
    try {
      var endpoint = "";
      switch (type) {
        case CategoryType.all:
          endpoint = Strings.allProductListEndpoint;
          break;
        case CategoryType.female:
          endpoint = Strings.femaleProductListEndpoint;
          break;
        case CategoryType.male:
          endpoint = Strings.maleProductListEndpoint;
          break;
        case CategoryType.accessory:
          endpoint = Strings.accessoriesProductListEndpoint;
          break;
      }

      Response response =
          await dio.get(Strings.apiBaseUrl + Strings.apiVersion + endpoint);

      if (response.statusCode == StatusCode.success) {
        var productList = (response.data["data"] as List<dynamic>)
            .map((product) => Product.fromJson(product as Map<String, dynamic>))
            .toList();
        return ProductListResponse(
            response.statusCode, response.statusMessage, productList);
      } else {
        log (response.statusCode.toString() + response.statusMessage.toString());
        return ProductListResponse(
            response.statusCode, response.statusMessage, []);
      }
    } catch (e) {
      log(e.toString());
      return ProductListResponse(9999, e.toString(), []);
    }
  }
}

class ProductListResponse extends IApiResponse {
  ProductListResponse(super.code, super.message, this.productList);

  final List<Product> productList;
}

enum CategoryType { all, female, male, accessory }
