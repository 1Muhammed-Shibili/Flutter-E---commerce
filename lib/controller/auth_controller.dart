import 'package:e_kart/model/user.dart';
import 'package:e_kart/screens/home_screen.dart';
import 'package:e_kart/screens/login_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var user = Rx<User?>(null);

  void login(String email, String password) {
    // Mock authentication - in a real app, you would validate against a backend
    if (email.isNotEmpty && password.isNotEmpty) {
      user.value = User(email: email, password: password);
      isLoggedIn.value = true;
      Get.offAll(() => HomeScreen());
    } else {
      Get.snackbar(
        'Error',
        'Please enter valid credentials',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void register(String email, String password) {
    // Mock registration - in a real app, you would send this to a backend
    if (email.isNotEmpty && password.isNotEmpty) {
      user.value = User(email: email, password: password);
      isLoggedIn.value = true;
      Get.offAll(() => HomeScreen());
    } else {
      Get.snackbar(
        'Error',
        'Please enter valid credentials',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() {
    user.value = null;
    isLoggedIn.value = false;
    Get.offAll(() => LoginScreen());
  }
}
