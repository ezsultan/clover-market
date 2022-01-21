// ignore_for_file: unused_import, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clover/model/user_model.dart';
import 'package:clover/provider/auth_provider.dart';
import 'package:clover/provider/product_provider.dart';
import 'package:clover/widget/custom_countdown_card.dart';
import 'package:clover/widget/custom_textfield.dart';
import 'package:clover/widget/discount_product.dart';
import 'package:clover/widget/flash_sale.dart';
import 'package:clover/widget/recommend_sale.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List image = [
    'assets/promotion.jpg',
    'assets/promotion1.jpg',
    'assets/promotion2.jpg',
  ];
  List text = [
    'Diskon Sampai\nDengan 50%',
    'Hanya Untuk\nKamu',
    'Penawaran Terbatas!\nBuruan Serbu',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    const double itemHeight = 200;
    const double itemWidth = 140;

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
                hintText: 'Search Product',
                imageUrl: 'assets/icon_search.png',
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/cart',
                );
              },
              child: Image.asset(
                'assets/icon_cart.png',
                width: 24,
              ),
            ),
            const SizedBox(width: 16),
            Image.asset(
              'assets/icon_notification.png',
              width: 24,
            ),
          ],
        ),
      );
    }

    Widget promotionCard() {
      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
            ),
            items: image
                .map(
                  (item) => Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(defaultRadius),
                          image: DecorationImage(
                            image: AssetImage(
                              item,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: double.infinity,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 34,
                          vertical: 32,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${text[currentIndex]}',
                              style: whiteTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                const CountDownCard(
                                  text: '15',
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  ':',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: extraBold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const CountDownCard(
                                  text: '09',
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  ':',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: extraBold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const CountDownCard(
                                  text: '20',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: image.map((urlOfItem) {
              int index = image.indexOf(urlOfItem);
              return Container(
                width: 8,
                height: 8,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? kPrimaryColor : borderColor,
                ),
              );
            }).toList(),
          )
        ],
      );
    }

    Widget flashSaleTile() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Potongan harga %',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Lainnya'),
                )
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.products
                    .map(
                      (product) => Flashsalestile(
                        product: product,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      );
    }

    Widget recomendedProduct() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 205,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/promotion2.jpg',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 28, 24, 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rekomendasi\nProduct',
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Yang terbaik hanya untuk anda',
                        style: whiteTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              physics: const ScrollPhysics(),
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: productProvider.products
                  .map(
                    (item) => RecomendedProductTile(
                      product: item,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          header(),
          const SizedBox(height: 20),
          promotionCard(),
          flashSaleTile(),
          const SizedBox(height: 20),
          recomendedProduct(),
        ],
      ),
    );
  }
}
