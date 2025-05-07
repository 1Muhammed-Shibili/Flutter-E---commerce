import 'package:e_kart/model/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 1));
      var productData = [
        Product(
          id: 1,
          name: 'Smartphone',
          price: 699.99,
          image: 'assets/smartphone.jpg',
          description: 'Latest smartphone with high-end features',
        ),
        Product(
          id: 2,
          name: 'Laptop',
          price: 1299.99,
          image: 'assets/Laptop.jpeg',
          description: 'Powerful laptop for work and gaming',
        ),
        Product(
          id: 3,
          name: 'Headphones',
          price: 199.99,
          image: 'assets/headphones.jpg',
          description: 'Noise-cancelling wireless headphones',
        ),
        Product(
          id: 4,
          name: 'Smartwatch',
          price: 249.99,
          image: 'assets/smartwatch.jpg',
          description: 'Track your fitness and stay connected',
        ),
        Product(
          id: 5,
          name: 'Tablet',
          price: 499.99,
          image: 'assets/tablet.jpg',
          description: 'Portable tablet for entertainment and productivity',
        ),
      ];
      products.value = productData;
    } finally {
      isLoading.value = false;
    }
  }

  Product findById(int id) {
    return products.firstWhere((product) => product.id == id);
  }
}
