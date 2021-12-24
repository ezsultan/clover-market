import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomTac extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onPressed;

  const CustomTac({
    Key? key,
    required this.onPressed,
    this.text1 = '',
    this.text2 = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: onPressed,
            child: Text.rich(
              TextSpan(
                text: text1,
                style: greyTextStyle.copyWith(fontSize: 12),
                children: [
                  TextSpan(
                    text: text2,
                    style: blueTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
