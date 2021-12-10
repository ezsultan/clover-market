import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

/// class CustomBottomNavbar digunakan untuk menampilkan navigasi di layar bagian bawah
class CustomBottomNavbar extends StatelessWidget {
  /// field untuk menampilkan icon navigasi
  final String imageUrl;

  /// field untuk menampilkan garis bawah pada navigasi yang dipilih
  final bool isSelected;
  final String title;
  final String route;
  const CustomBottomNavbar(
      {Key? key,
      required this.imageUrl,
      this.isSelected = false,
      required this.title,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(title,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              )),
        ],
      ),
    );
  }
}
