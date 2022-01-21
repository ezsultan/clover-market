import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class CountDownCard extends StatelessWidget {
  final String text;
  const CountDownCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Center(
        child: Text(
          text,
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: extraBold,
          ),
        ),
      ),
    );
  }
}
