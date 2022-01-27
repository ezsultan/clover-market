import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
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
              color: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget productOption() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hasil 0',
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Buah',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: bold,
                  ),
                ),
                const Icon(Icons.arrow_drop_down_outlined)
              ],
            )
          ],
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.cancel,
              color: kRedColor,
              size: 70,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Produk Tidak Ditemukan',
              style: greyTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Terima kasih telah menggunakan Clover',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 80,
              ),
              child: CustomeButton(
                  text: "Kembali ke home",
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  }),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            header(),
            const SizedBox(height: 10),
            Divider(
              color: borderColor,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            productOption(),
            const SizedBox(
              height: 120,
            ),
            content()
          ],
        ),
      ),
    );
  }
}
