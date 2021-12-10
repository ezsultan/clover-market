import 'package:clover/shared/bottom_navbar.dart';
import 'package:clover/shared/theme.dart';
import 'package:clover/widget/profile_tile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        width: 90,
        height: 90,
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: const DecorationImage(
            image: AssetImage(
              'assets/profile.jpg',
            ),
          ),
        ),
      );
    }

    Widget profileTile() {
      return Column(
        children: const [
          ProfileTile(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: Column(
        children: [
          image(),
          profileTile(),
        ],
      ),
    );
  }
}
