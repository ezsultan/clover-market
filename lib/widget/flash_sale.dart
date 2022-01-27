import 'package:cached_network_image/cached_network_image.dart';
import 'package:clover/model/product_model.dart';
import 'package:clover/page/detail_product_page.dart';
import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Flashsalestile extends StatefulWidget {
  final ProductModel product;
  const Flashsalestile({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<Flashsalestile> createState() => _FlashsalestileState();
}

class _FlashsalestileState extends State<Flashsalestile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(
              product: widget.product,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 140,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  color: borderColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      widget.product.photos![0].url!,
                    ),
                    // image: NetworkImage(
                    //   widget.product.photos![0].url!,
                    // ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                NumberFormat.currency(
                  locale: 'id',
                  decimalDigits: 0,
                  symbol: 'Rp.',
                ).format(widget.product.price! -
                    (widget.product.price! * widget.product.discount!) / 100),
                style: greenTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      decimalDigits: 0,
                      symbol: 'Rp',
                    ).format(widget.product.price),
                    style: greyTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.product.discount!.round()}% Off',
                    style: greyTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
