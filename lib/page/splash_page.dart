import 'dart:async';

import 'package:clover/page/login_page.dart';
import 'package:clover/page/main_page.dart';
import 'package:clover/provider/auth_provider.dart';
import 'package:clover/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:clover/shared/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  checkToken() async {
    await getInit();
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    bool hasil = await authProvider.checkToken();
    print(hasil);
    print(authProvider.token?.token);
    if (hasil) {
      return Timer(
        const Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        ),
      );
    } else {
      return Timer(
        const Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 253,
              height: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_logo.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
