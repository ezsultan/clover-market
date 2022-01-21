import 'package:clover/page/home_page.dart';
import 'package:clover/page/products_page.dart';
import 'package:clover/page/about_page.dart';
import 'package:clover/page/transaction_page.dart';
// import 'package:clover/shared/bottom_navbar.dart';
import 'package:clover/shared/theme.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, String? token}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget customBottomNavbar() {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              10,
            ),
          ),
          child: BottomAppBar(
            notchMargin: 12,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              backgroundColor: kWhiteColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 26,
                      color: currentIndex == 0
                          ? kPrimaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      'assets/icon_search.png',
                      width: 26,
                      color: currentIndex == 1
                          ? kPrimaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Eksplor',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      'assets/icon_card.png',
                      width: 26,
                      color: currentIndex == 2
                          ? kPrimaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Transaksi',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      'assets/icon_user.png',
                      width: 26,
                      color: currentIndex == 3
                          ? kPrimaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Akun',
                ),
              ],
              selectedLabelStyle: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
              selectedItemColor: kPrimaryColor,
              unselectedLabelStyle: blackTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ProductPage();
        case 2:
          return const TransactionPage();
        case 3:
          return const AboutPage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: customBottomNavbar(),
      backgroundColor: kBackgroundColor,
      body: body(),
    );
  }
}
