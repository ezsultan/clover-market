import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomProfileTile extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String information;
  const CustomProfileTile({
    required this.title,
    required this.iconUrl,
    required this.information,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconUrl,
          width: 20,
          color: kPrimaryColor,
        ),
        const SizedBox(width: 15),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
          ),
        ),
        const Spacer(),
        Text(
          information,
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: light,
          ),
        ),
        const SizedBox(width: 15),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: kGreyColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
