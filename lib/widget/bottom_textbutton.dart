import 'package:flutter/material.dart';
import '../shared/theme.dart';

class BottomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const BottomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
          ),
          TextButton(onPressed: onPressed, child: const Text('disini')),
        ],
      ),
    );
  }
}
