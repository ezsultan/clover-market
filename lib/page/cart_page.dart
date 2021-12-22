import 'package:clover/widget/custom_button.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar _buildAppbar() {
      return AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        foregroundColor: kBlackColor,
        title: Text(
          'Keranjang',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
      );
    }

    Widget cartItems() {
      return Container(
        width: double.infinity,
        height: 130,
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 20,
          bottom: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(
                right: 15,
              ),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/jeruk.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jeruk',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '15000/kg',
                  style: greenTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/Groupmin.png',
                        width: 24,
                        color: kGreyColor,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(),
                      child: const Center(
                        child: Text('1'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/Groupplus.png',
                        width: 24,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
                size: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: CustomeButton(
        text: 'Lanjutkan Transaksi',
        onPressed: () {},
      ),
      appBar: _buildAppbar(),
      body: ListView(
        children: [
          cartItems(),
          cartItems(),
          cartItems(),
        ],
      ),
    );
  }
}
