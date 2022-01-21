// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import '../shared/theme.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // content state
  int contentState = 0;

  // List of title
  List<String> titles = [
    'Ditanam dengan metode terbaik',
    'Membantu perekonomian petani',
    'Menghasilkan sayuran berkualitas',
  ];

  // List of descriptions
  List<String> descriptions = [
    'Menggunakan metode terkini sehingga menghasilkan buah dan sayuran yang segar dan higenis',
    'Buah dan sayuran di hasilkan dari seluruh petani terbaik di indonesia',
    'Produk yang kami hasilkan dapat kami pastikan berkualitas dan segar karena telah melalui pengecekan terlebih dahulu',
  ];

  // List of images path
  List<String> images = [
    'assets/illustration1.png',
    'assets/illustration2.png',
    'assets/illustration3.png',
  ];

  // Get Title
  String getTitle(int contentState) {
    if (contentState == 0) {
      return titles[0];
    } else if (contentState == 1) {
      return titles[1];
    } else {
      return titles[2];
    }
  }

  // Get Description
  String getDescription(int contentState) {
    if (contentState == 0) {
      return descriptions[0];
    } else if (contentState == 1) {
      return descriptions[1];
    } else {
      return descriptions[2];
    }
  }

  // Get Images
  String getImage(int contentState) {
    if (contentState == 0) {
      return images[0];
    } else if (contentState == 1) {
      return images[1];
    } else {
      return images[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Image Illustration
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              margin: const EdgeInsets.only(
                top: 24.0,
              ),
              child: Image(
                width: double.infinity,
                height: 600.0,
                image: AssetImage(
                  getImage(contentState),
                ),
              ),
            ),
            // Top Components
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contentState != 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              contentState--;
                              print(contentState);
                            });
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 18.0,
                          ),
                        )
                      : const SizedBox(),
                  contentState != 3
                      ? TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/login',
                            );
                          },
                          child: const Text(
                            'Lewati',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            // Content
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: Container(
                  width: double.infinity,
                  color: 'FBFDFF'.toColor(),
                  padding: const EdgeInsets.all(
                    32.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        getTitle(contentState),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      // Description
                      Text(
                        getDescription(contentState),
                        textAlign: TextAlign.center,
                        style: greyTextStyle.copyWith(
                          letterSpacing: 1.0,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // Bottom Components
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Indicator
                          Row(
                            children: [
                              // 0
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  30.0,
                                ),
                                child: Container(
                                  height: 4.0,
                                  width: contentState == 0 ? 18.0 : 12.0,
                                  color: contentState == 0
                                      ? kPrimaryColor
                                      : kGreyColor,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              // 1
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  30.0,
                                ),
                                child: Container(
                                  height: 4.0,
                                  width: contentState == 1 ? 18.0 : 12.0,
                                  color: contentState == 1
                                      ? kPrimaryColor
                                      : kGreyColor,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              // 2
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  30.0,
                                ),
                                child: Container(
                                  height: 4.0,
                                  width: contentState == 2 ? 18.0 : 12.0,
                                  color: contentState == 2
                                      ? kPrimaryColor
                                      : kGreyColor,
                                ),
                              ),
                            ],
                          ),
                          // Button Next
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (contentState <= 1) {
                                  contentState++;
                                } else if (contentState == 2) {
                                  Navigator.pushNamed(
                                    context,
                                    '/login',
                                  );
                                } else {}
                              });
                            },
                            child: Image(
                              color: kPrimaryColor,
                              height: 40.0,
                              width: 40.0,
                              image: const AssetImage(
                                'assets/next.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
