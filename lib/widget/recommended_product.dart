import 'package:clover/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class RecommendedProduct extends StatelessWidget {
  final ProductModel product;
  const RecommendedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 170,
        height: 260,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.network(
              product.photos![0].url!,
              width: 170,
              height: 150,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.category!.name!,
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        product.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rp ${product.price!.round().toString()}',
                        style: greenTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
