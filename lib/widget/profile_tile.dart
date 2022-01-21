import 'package:clover/provider/auth_provider.dart';
import 'package:clover/services/auth_services.dart';
import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTile extends StatelessWidget {
  final VoidCallback? onTap;
  const ProfileTile({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleLogout() async {
      bool? logout = await AuthServices().removeToken();
      if (logout ?? true) {
        Navigator.pushNamed(context, '/login');
        print(authProvider.token?.token);
      }
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 20,
          ),
          margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.person_rounded,
                color: kPrimaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Akun Saya',
                style: greyTextStyle,
              ),
              const Spacer(),
              Icon(
                Icons.navigate_next,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 20,
          ),
          margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.notifications,
                color: kPrimaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Notifikasi',
                style: greyTextStyle,
              ),
              const Spacer(),
              Icon(
                Icons.navigate_next,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 20,
          ),
          margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.settings_rounded,
                color: kPrimaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Pengaturan',
                style: greyTextStyle,
              ),
              const Spacer(),
              Icon(
                Icons.navigate_next,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: handleLogout,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: 20,
            ),
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  style: greyTextStyle,
                ),
                const Spacer(),
                Icon(
                  Icons.navigate_next,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
