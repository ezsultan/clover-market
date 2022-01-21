import 'package:clover/model/product_model.dart';
import 'package:clover/page/detail_product_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shared/theme.dart';

class DiscountProduct extends StatefulWidget {
  final ProductModel product;
  const DiscountProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DiscountProduct> createState() => _DiscountProductState();
}

class _DiscountProductState extends State<DiscountProduct> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(product: widget.product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: 24,
          right: 24,
        ),
        padding: const EdgeInsets.only(
          top: 10,
          left: 15,
          right: 15,
          bottom: 10,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset.infinite,
            ),
          ],
          color: kWhiteColor,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBackgroundColor,
                  image: const DecorationImage(
                      image: AssetImage('assets/jeruk.png'))
                  // image: widget.product.photos!.isNotEmpty
                  //     ? DecorationImage(
                  //         image: NetworkImage(
                  //         widget.product.photos![0].url!,
                  //       )

                  //         // image: AssetImage('assets/jeruk.png'),
                  //         // image: NetworkImage(
                  //         //   product.photos![0].url!,
                  //         // ),
                  //         )
                  //     : DecorationImage(
                  //         image: AssetImage('assets/labu.png'),
                  //       ),
                  ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name!,
                  style: blackTextStyle.copyWith(
                      fontSize: 15, fontWeight: semiBold),
                ),
                Text(
                  widget.product.category!.name!,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Diskon ${widget.product.discount!.round()}%',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text(
                  //   'Rp ${product.price!.round().toString()}',
                  //   style: secondaryTextStyle.copyWith(
                  //     fontSize: 10,
                  //     fontWeight: bold,
                  //     decoration: TextDecoration.lineThrough,
                  //   ),
                  // ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      decimalDigits: 0,
                      symbol: 'Rp',
                    ).format(widget.product.price),
                    style: secondaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  // Text(
                  //   'Rp ${product.price!.round().toInt() - product.discount!.toInt()}',
                  //   style: greenTextStyle.copyWith(
                  //     fontWeight: bold,
                  //   ),
                  // ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      decimalDigits: 0,
                      symbol: 'Rp.',
                    ).format(widget.product.price! -
                        (widget.product.price! * widget.product.discount!) /
                            100),
                    style: greenTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
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
