import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String qty;
  const CartTile({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: defaultMargin,
        right: defaultMargin,
      ),
      width: double.infinity,
      height: 102,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: borderColor,
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$price x $qty',
                    style: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_circle,
                        color: kRedColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add_circle,
                        color: kRedColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Icon(
            Icons.delete_forever,
            size: 40,
            color: kRedColor,
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
