import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets margin;
  final bool isLoading;
  const CustomeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 45),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? Container(
                    width: 15,
                    height: 15,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(kWhiteColor),
                    ),
                  )
                : const SizedBox(),
            Text(
              text,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
