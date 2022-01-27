// ignore_for_file: unused_import

import 'package:clover/provider/auth_provider.dart';
import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Widget header() {
      return Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: kBlackColor,
              borderRadius: BorderRadius.circular(90),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/avatar.jpg',
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EZ',
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '@Sultan',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget content() {
      return Column(
        children: const [
          CustomProfileTile(
            title: 'Email',
            iconUrl: 'assets/Message.png',
            information: 'Email',
          ),
          CustomProfileTile(
            title: 'Telepon',
            iconUrl: 'assets/Phone.png',
            information: '+6283819927809',
          ),
          CustomProfileTile(
            title: 'Ubah kata sandi',
            iconUrl: 'assets/Password.png',
            information: '....................',
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: blackTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
        bottom: PreferredSize(
            child: Container(
              height: 1,
              color: borderColor,
            ),
            preferredSize: const Size.fromHeight(1)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: kBlackColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 24,
        ),
        child: Column(
          children: [
            header(),
            const SizedBox(height: 30),
            content(),
          ],
        ),
      ),
    );
  }
}
