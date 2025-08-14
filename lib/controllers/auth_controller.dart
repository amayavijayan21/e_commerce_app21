import 'package:get/get.dart';
import '../services/api_service.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;

  Future<void> login(String username, String password) async {
    try {
      isLoading.value = true;
      final result = await ApiService.login(username, password);
      token.value = result['token'];
      Get.offAllNamed('/products');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
