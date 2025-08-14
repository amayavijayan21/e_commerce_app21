import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final data = await ApiService.getProducts();
      products.value = data.map<Product>((json) => Product.fromJson(json)).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
