import 'package:clover/model/cart_model.dart';
import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class productiletransaction extends StatelessWidget {
  // final CartModel cart;
  const productiletransaction({
    Key? key,
    // required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      width: double.infinity,
      height: 100,
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
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: kProductColor,
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/labu.png',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Labu',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp 12000',
                    style: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sayur',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '2 produk',
            style: greyTextStyle.copyWith(
              fontSize: 12,
              fontWeight: light,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
