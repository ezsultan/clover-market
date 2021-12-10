import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class IconCart extends StatelessWidget {
  const IconCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(15)),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.minimize)),
        ),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(15)),
          child: const Text('1'),
        ),
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(top: 17),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
      ],
    );
  }
}
