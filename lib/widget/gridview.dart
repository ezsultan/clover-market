import 'package:flutter/material.dart';
import '../shared/theme.dart';

class GridViewProduct extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final Function()? ontap;
  const GridViewProduct(
      {Key? key,
      this.ontap,
      required this.title,
      required this.imageUrl,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            boxShadow: [
              BoxShadow(
                color: kGreyColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(
                  imageUrl,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: bold),
                      ),
                      Text(
                        price,
                        style: greenTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.add_shopping_cart,
                    color: kPrimaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
