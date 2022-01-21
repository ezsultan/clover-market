import 'package:cached_network_image/cached_network_image.dart';
import 'package:clover/model/product_model.dart';
import 'package:clover/page/detail_product_page.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class GridViewProduct extends StatelessWidget {
  final ProductModel product;
  const GridViewProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset.infinite,
            ),
          ],
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kBackgroundColor,
                // image: DecorationImage(
                //   image: NetworkImage(
                //     product.photos![0].url!,
                //   ),
                // ),
              ),
              child: CachedNetworkImage(
                imageUrl: product.photos![0].url!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        product.name!,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                        maxLines: 1,
                      ),
                      Text(
                        product.category!.name!,
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Rp ${product.price!.round().toString()}',
                        style: greenTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                      right: 15,
                      top: 25,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.topLeft,
                        colors: [kPrimaryColor, Colors.greenAccent],
                      ),
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add,
                        color: kWhiteColor,
                        size: 24,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
