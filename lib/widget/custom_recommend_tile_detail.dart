import 'package:clover/model/product_model.dart';
import 'package:clover/page/detail_product_page.dart';
import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecommendDetail extends StatefulWidget {
  final ProductModel product;
  const RecommendDetail({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendDetail> createState() => _RecommendDetailState();
}

class _RecommendDetailState extends State<RecommendDetail> {
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
        width: 130,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                    image: NetworkImage(
                      widget.product.photos![0].url!,
                    ),
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      NumberFormat.currency(
                        locale: 'id',
                        decimalDigits: 0,
                        symbol: 'Rp.',
                      ).format(widget.product.price! -
                          (widget.product.price! * widget.product.discount!) /
                              100),
                      style: greenTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icon_star.png',
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
