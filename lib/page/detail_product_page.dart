import 'package:carousel_slider/carousel_slider.dart';
import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  AppBar _buildAppbar() {
    return AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
      ],
      backgroundColor: kBackgroundColor,
      elevation: 0,
      foregroundColor: kBlackColor,
      title: Text(
        'Detail',
        style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  List images = [
    'assets/jeruk1.png',
    'assets/jeruk2.png',
    'assets/jeruk3.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? kPrimaryColor : kGreyColor,
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          children: [
            CarouselSlider(
              items: images
                  .map(
                    (image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicator(
                  index,
                );
              }).toList(),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note : Header
            Container(
              margin: EdgeInsets.only(top: defaultMargin, left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jeruk',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        '15000/kg',
                        style: greenTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'jeruk merupakan sumber vitamin C yang sangat baik, kandungan air yang tinggi dan rasanya yang segar sangat baik untuk tubuh kita',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppbar(),
      bottomNavigationBar: CustomeButton(
        text: "Beli Sekarang",
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/cart',
          );
        },
      ),
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
