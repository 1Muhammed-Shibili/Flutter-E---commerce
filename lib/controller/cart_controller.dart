import 'package:e_kart/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  int get itemCount => cartItems.length;

  void addToCart(Product product) {
    cartItems.add(product);
    Get.snackbar(
      'Product Added',
      '${product.name} has been added to your cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    Get.snackbar(
      'Product Removed',
      '${product.name} has been removed from your cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void clearCart() {
    cartItems.clear();
  }
}
