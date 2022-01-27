// ignore_for_file: unused_import

import 'package:clover/page/cart_page.dart';
import 'package:clover/page/detail_product_page.dart';
import 'package:clover/page/forgot_password_page.dart';
import 'package:clover/page/forgot_password_success.dart';
import 'package:clover/page/home_page.dart';
import 'package:clover/page/login_page.dart';
import 'package:clover/page/main_page.dart';
import 'package:clover/page/main_product_page.dart';
import 'package:clover/page/onboarding_page.dart';
import 'package:clover/page/otp_register_page.dart';
import 'package:clover/page/about_page.dart';
import 'package:clover/page/explore_page.dart';
import 'package:clover/page/profile_page.dart';
import 'package:clover/page/reset_password.dart';
import 'package:clover/page/signup_page.dart';
import 'package:clover/page/splash_page.dart';
import 'package:clover/page/transaction_page.dart';
import 'package:clover/provider/auth_provider.dart';
import 'package:clover/provider/cart_provider.dart';
import 'package:clover/provider/counter_provider.dart';
import 'package:clover/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/started': (context) => const OnBoardingScreen(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/explore': (context) => const ExplorePage(),
          '/cart': (context) => const CartPage(),
          '/about': (context) => const AboutPage(),
          '/transaction': (context) => const TransactionPage(),
          '/forgot': (context) => const ForgotPassword(),
          '/forgotsuccess': (context) => const ForgotPasswordSuccess(),
          '/resetpassword': (context) => const ResetPassword(),
          '/otp': (context) => const OtpRegisterPage(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
