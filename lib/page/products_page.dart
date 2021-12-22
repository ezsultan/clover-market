import 'package:clover/widget/gridview.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          childAspectRatio: (itemWidth / itemHeight),
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: const [
            GridViewProduct(
              title: 'Jeruk',
              imageUrl: 'assets/jeruk.png',
              price: '15000/kg',
            ),
            GridViewProduct(
              title: 'Apel',
              imageUrl: 'assets/apel.png',
              price: '35000/kg',
            ),
            GridViewProduct(
              title: 'Kol',
              imageUrl: 'assets/kol.png',
              price: '5000/kg',
            ),
            GridViewProduct(
              title: 'Mentimun',
              imageUrl: 'assets/timun.png',
              price: '7000/kg',
            ),
            GridViewProduct(
              title: 'Nanas',
              imageUrl: 'assets/nanas.png',
              price: '8000/pcs',
            ),
            GridViewProduct(
              title: 'Semangka',
              imageUrl: 'assets/semangka.png',
              price: '20000/pcs',
            ),
            GridViewProduct(
              title: 'Cabai',
              imageUrl: 'assets/cabai.png',
              price: '6000/kg',
            ),
            GridViewProduct(
              title: 'Melon',
              imageUrl: 'assets/melon.png',
              price: '6000/kg',
            ),
            GridViewProduct(
              title: 'Mangga',
              imageUrl: 'assets/mangga.png',
              price: '10000/kg',
            ),
          ],
        ),
      ),
    );
  }
}
