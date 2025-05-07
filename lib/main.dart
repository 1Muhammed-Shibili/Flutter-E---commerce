import 'package:e_kart/controller/auth_controller.dart';
import 'package:e_kart/controller/cart_controller.dart';
import 'package:e_kart/controller/product_controller.dart';
import 'package:e_kart/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(ProductController());
    Get.put(CartController());

    return GetMaterialApp(
      title: 'Flutter E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
