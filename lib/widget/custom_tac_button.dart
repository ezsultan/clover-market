import 'package:clover/shared/theme.dart';
import 'package:flutter/cupertino.dart';

class CustomTacButton extends StatelessWidget {
  final String text;
  final String button;
  final Function() onPressed;
  const CustomTacButton({
    Key? key,
    required this.text,
    required this.button,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: greyTextStyle.copyWith(
            fontSize: 12,
            fontWeight: light,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            button,
            style: blueTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
