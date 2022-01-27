import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButtonOauth extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Function() onPressed;
  const CustomButtonOauth({
    Key? key,
    required this.text,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 24,
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              text,
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor),
          primary: kBackgroundColor,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
