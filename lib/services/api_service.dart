import 'dart:convert';

import 'package:software_persona_mobile/models/products_model.dart';
import 'package:http/http.dart' as http;

// Bu servis ürün listesini API üzerinden getirir.
class ApiService {

  Future<ProductsModel> fetchProducts () async {
    final response = await http.get(
      Uri.parse("https://wantapi.com/products.php"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProductsModel.fromJson(data);
      } else {
        throw Exception("Failed to load products");
      }

    
  }

}