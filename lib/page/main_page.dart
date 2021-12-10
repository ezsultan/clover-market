import 'package:clover/page/home_page.dart';
import 'package:clover/shared/bottom_navbar.dart';
import 'package:clover/shared/theme.dart';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, String? token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return const HomePage();
    }

    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
        ],
      ),
    );
  }
}
