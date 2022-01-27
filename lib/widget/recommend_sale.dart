import 'package:cached_network_image/cached_network_image.dart';
import 'package:clover/model/product_model.dart';
import 'package:clover/page/detail_product_page.dart';
import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecomendedProductTile extends StatefulWidget {
  final ProductModel product;
  const RecomendedProductTile({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<RecomendedProductTile> createState() => _RecomendedProductTileState();
}

class _RecomendedProductTileState extends State<RecomendedProductTile> {
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
        width: 140,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(color: kProductColor),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
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
                  symbol: 'Rp',
                ).format(widget.product.price),
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.category!.name!,
                    style: greenTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: bold,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 12,
                      ),
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 12,
                      ),
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 12,
                      ),
                      Image.asset(
                        'assets/icon_star_yellow.png',
                        width: 12,
                      ),
                      Image.asset(
                        'assets/icon_star.png',
                        width: 12,
                      ),
                    ],
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
