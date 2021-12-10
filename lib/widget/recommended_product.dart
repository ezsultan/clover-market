import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class RecommendedProduct extends StatelessWidget {
  final String name;
  final String category;
  final String imageUrl;
  final String price;
  const RecommendedProduct(
      {Key? key,
      required this.category,
      required this.name,
      required this.imageUrl,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 180,
        height: 270,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              imageUrl,
              width: 215,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 10,
                right: 20,
              ),
              child: Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          name,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          price,
                          style: greenTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
