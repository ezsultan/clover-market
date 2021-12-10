import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clover/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, '/started');
      },
    );
    super.initState();
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
