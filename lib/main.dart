import 'package:clover/page/cart_page.dart';
import 'package:clover/page/detail_product_page.dart';
import 'package:clover/page/login_page.dart';
import 'package:clover/page/main_page.dart';
import 'package:clover/page/main_product_page.dart';
import 'package:clover/page/onboarding_page.dart';
import 'package:clover/page/profile_page.dart';
import 'package:clover/page/signup_page.dart';
import 'package:clover/page/splash_page.dart';
import 'package:clover/page/transaction_page.dart';
import 'package:clover/provider/auth_provider.dart';
import 'package:clover/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/started': (context) => const OnBoardingScreen(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/product': (context) => const MainProductPage(),
          '/cart': (context) => const CartPage(),
          '/profile': (context) => const ProfilePage(),
          '/detail': (context) => const DetailProduct(),
          '/transaction': (context) => const TransactionPage()
        },
      ),
    );
  }
}
