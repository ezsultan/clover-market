import 'package:clover/shared/theme.dart';
import 'package:flutter/widgets.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  const CustomTextButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: blueTextStyle.copyWith(
        fontSize: 12,
        fontWeight: bold,
      ),
    );
  }
}
