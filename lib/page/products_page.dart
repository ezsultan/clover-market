import 'package:clover/provider/product_provider.dart';
import 'package:clover/widget/gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: productProvider.products
                .map(
                  (product) => GridViewProduct(
                    product: product,
                  ),
                )
                .toList()),
      ),
    );
  }
}
