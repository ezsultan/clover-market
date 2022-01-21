import 'package:clover/widget/custom_button.dart';
import 'package:clover/widget/custom_cart_tile.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar _buildAppbar() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
        foregroundColor: kBlackColor,
        title: Text(
          'Keranjang',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/empty_cart.png',
              width: 70,
              color: kRedColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'oops!',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Keranjang anda kosong!\nTemukan produk yang anda inginkan',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: CustomeButton(
                  text: 'Cari produk',
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/home',
                    );
                  }),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        children: const [
          CartTile(
            imageUrl: 'assets/labu.png',
            price: 'Rp 9999',
            title: 'Ini tu labuh',
            qty: '2',
          ),
          CartTile(
            imageUrl: 'assets/labu.png',
            price: 'Rp 9999',
            title: 'Ini tu labuh',
            qty: '2',
          ),
          CartTile(
            imageUrl: 'assets/labu.png',
            price: 'Rp 9999',
            title: 'Ini tu labuh',
            qty: '2',
          ),
          CartTile(
            imageUrl: 'assets/labu.png',
            price: 'Rp 9999',
            title: 'Ini tu labuh',
            qty: '2',
          ),
          CartTile(
            imageUrl: 'assets/labu.png',
            price: 'Rp 9999',
            title: 'Ini tu labuh',
            qty: '2',
          ),
          CartTile(
            imageUrl: 'assets/labu.png',
            price: 'Rp 9999',
            title: 'Ini tu labuh',
            qty: '2',
          ),
          CartTile(
            imageUrl: 'assets/labu.png',
            price: 'Rp 9999',
            title: 'Ini tu labuh',
            qty: '2',
          ),
        ],
      );
    }

    Widget customBottomNavbar() {
      return SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: greenTextStyle,
                  ),
                  Text(
                    '9999',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              color: borderColor,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: defaultMargin,
              ),
              child: CustomeButton(
                text: 'Lanjutkan transaksi',
                color: kPrimaryColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      // bottomNavigationBar: CustomeButton(
      //   text: 'Lanjutkan Transaksi',
      //   onPressed: () {},
      //   color: kPrimaryColor,
      // ),
      appBar: _buildAppbar(),
      body: content(),
      bottomNavigationBar: customBottomNavbar(),
    );
  }
}
