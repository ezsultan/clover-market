import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets margin;
  final bool isLoading;
  final Color color;
  const CustomeButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.bottomRight,
        //   colors: [kPrimaryColor, Colors.greenAccent],
        // ),
        color: color,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
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
                      valueColor: AlwaysStoppedAnimation(
                        kWhiteColor,
                      ),
                    ),
                  )
                : const SizedBox(),
            Text(
              text,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
