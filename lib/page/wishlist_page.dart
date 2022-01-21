// ignore_for_file: unnecessary_import

import 'package:clover/shared/bottom_navbar.dart';
import 'package:clover/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Keranjang',
          style: blackTextStyle,
        ),
        backgroundColor: kBackgroundColor,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: kBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_cart.png',
                color: Colors.red,
                width: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Keranjang kosong :(',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Jelajahi Toko',
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      body: Column(
        children: [
          header(),
          emptyWishlist(),
        ],
      ),
    );
  }
}
