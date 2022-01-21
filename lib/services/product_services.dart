import 'dart:convert';
import 'package:clover/model/product_model.dart';
import 'package:http/http.dart' as https;

class ProductService {
  var baseurl = 'https://dev-api-clover.herokuapp.com/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseurl/products/mobile');
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Origin': 'https://clover-web-b7d402pby-frhnmubarok.vercel.app'
    };
    var response = await https.get(
      url,
      headers: header,
    );
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      print(data);
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('gagal get products');
    }
  }
}
