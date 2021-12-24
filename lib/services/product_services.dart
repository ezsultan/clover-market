import 'dart:convert';

import 'package:clover/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  var baseurl = 'https://dev-api-clover.herokuapp.com/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseurl/products');
    var header = {'Content-Type': 'Aplication-json'};
    var response = await http.get(
      url,
      headers: header,
    );
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJsonn(item));
      }
      return products;
    } else {
      throw Exception('gagal get products');
    }
  }
}
