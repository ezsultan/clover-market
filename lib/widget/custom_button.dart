import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets margin;
  const CustomeButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 20),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
          ),
          child: Text(
            text,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ));
  }
}
