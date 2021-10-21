import 'package:biguenoexpress/models/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var product = List<Product>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var response = [
      Product(

      )
    ];

    product.value = response;
  }
}