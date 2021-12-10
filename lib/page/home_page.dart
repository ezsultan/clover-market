import 'package:clover/widget/discount_product.dart';
import 'package:clover/widget/recommended_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ini adalah Widget untuk Header
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 30,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temukan Berbagai Macam\nbuah dan Sayuran',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Dengan harga dan kualitas terbaik',
                  style:
                      greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                ),
              ],
            )
          ],
        ),
      );
    }

    // ini adalah widget untuk menampilkan rekomendasi produk
    Widget recommendedProduct() {
      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              RecommendedProduct(
                category: 'sayuran',
                name: "Kol",
                imageUrl: 'assets/kol.png',
                price: '5000/kg',
              ),
              RecommendedProduct(
                category: 'Buah',
                name: "Apel",
                imageUrl: 'assets/apel.png',
                price: '35000/kg',
              ),
              RecommendedProduct(
                category: 'sayuran',
                name: "Mentimun",
                imageUrl: 'assets/timun.png',
                price: '7000/kg',
              ),
              RecommendedProduct(
                category: 'buah',
                name: "jeruk",
                imageUrl: 'assets/jeruk.png',
                price: '15000/kg',
              ),
              RecommendedProduct(
                category: 'buah',
                name: 'mangga',
                imageUrl: 'assets/mangga.png',
                price: '10000/kg',
              ),
            ],
          ),
        ),
      );
    }

    // ini adalah widget untuk menampilkan text mengenai diskon produk
    Widget discountTitle() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lagi Diskon nih',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Lihat semua',
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // ini adalah widget untuk menampilkan produk yang sedang diskon
    Widget discountProduct() {
      return Column(
        children: const [
          DiscountProduct(
            imageUrl: 'assets/kol.png',
            name: 'Kol',
            description: 'Cocok untuk\nhidangan',
            price: '5000/kg',
          ),
          DiscountProduct(
            imageUrl: 'assets/jeruk.png',
            name: 'Jeruk',
            description: 'Segar dan Manis',
            price: '15000/kg',
          ),
          DiscountProduct(
            imageUrl: 'assets/mangga.png',
            name: 'Mangga',
            description: 'Baik untuk\npencernaan',
            price: '10000/kg',
          ),
          DiscountProduct(
            imageUrl: 'assets/apel.png',
            name: 'Apel',
            description: 'Cocok untuk di jus',
            price: '35000/kg',
          ),
          DiscountProduct(
            imageUrl: 'assets/timun.png',
            name: 'Mentimun',
            description: 'Baik untuk\nkesehatan kulit',
            price: '7000/kg',
          ),
        ],
      );
    }

    // digunakan Untuk mereturn semua widget yang ada pada file home_page.dart
    return SafeArea(
      child: ListView(
        children: [
          header(),
          recommendedProduct(),
          discountTitle(),
          discountProduct()
        ],
      ),
    );
  }
}
