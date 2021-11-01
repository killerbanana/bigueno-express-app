import 'package:biguenoexpress/models/products.dart';
import 'package:biguenoexpress/models/sellers.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static var client = http.Client();

  static Future<List<Products>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://us-central1-test-project-9ddf7.cloudfunctions.net/api/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<Sellers>> fetchSellers() async {
    var response = await client.get(Uri.parse(
        'https://us-central1-test-project-9ddf7.cloudfunctions.net/biguenoapi/findAllSeller'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return sellersFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}