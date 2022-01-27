import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'Cari produk',
                imageUrl: 'assets/icon_search.png',
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Image.asset(
                'assets/icon_sort.png',
                width: 24,
              ),
            ),
            const SizedBox(width: 16),
            Image.asset(
              'assets/icon_filter.png',
              width: 24,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            header(),
          ],
        ),
      ),
    );
  }
}
