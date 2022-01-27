import 'package:clover/provider/cart_provider.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:clover/widget/custom_cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../shared/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
        children: cartProvider.cart
            .map((cart) => CartTile(
                  cart: cart,
                ))
            .toList(),
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
                    NumberFormat.currency(
                      locale: 'id',
                      decimalDigits: 0,
                      symbol: 'Rp ',
                    ).format(cartProvider.totalPrice()),
                    style: greenTextStyle.copyWith(
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
      appBar: _buildAppbar(),
      body: content(),
      bottomNavigationBar: customBottomNavbar(),
    );
  }
}
