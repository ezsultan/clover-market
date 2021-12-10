import 'package:flutter/material.dart';
import '../shared/theme.dart';

class DiscountProduct extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String description;

  const DiscountProduct(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(18),
                  color: kBackgroundColor,
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(
                      fontSize: 15, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style:
                      blackTextStyle.copyWith(fontSize: 12, fontWeight: light),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: greenTextStyle.copyWith(fontWeight: bold),
                  ),
                  Text(
                    'diskon 30%',
                    style: blackTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
