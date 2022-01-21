import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomAboutTile extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback onPressed;
  const CustomAboutTile({
    required this.iconUrl,
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 20,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconUrl,
                  width: 22,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: kGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
