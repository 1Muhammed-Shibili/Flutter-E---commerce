import 'package:e_kart/controller/auth_controller.dart';
import 'package:e_kart/controller/cart_controller.dart';
import 'package:e_kart/controller/product_controller.dart';
import 'package:e_kart/screens/cart_screen.dart';
import 'package:e_kart/screens/product_detail_screen.dart';
import 'package:e_kart/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final ProductController productController = Get.find<ProductController>();
  final CartController cartController = Get.find<CartController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter E-Commerce',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final bool? confirm = await Get.dialog<bool>(
                AlertDialog(
                  title: const Text('Logout Confirmation'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(result: false),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(result: true),
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                authController.logout();
              }
            },
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.to(() => CartScreen());
                },
              ),
              Obx(
                () =>
                    cartController.itemCount > 0
                        ? Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${cartController.itemCount}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                        : SizedBox(),
              ),
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              final product = productController.products[index];
              return ProductCard(
                product: product,
                onTap: () {
                  Get.to(() => ProductDetailScreen(productId: product.id));
                },
                onAddToCart: () {
                  cartController.addToCart(product);
                },
              );
            },
          );
        }
      }),
    );
  }
}
