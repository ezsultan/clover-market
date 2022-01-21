import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 100,
          left: 45,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lupa kata sandi',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Masukan email anda untuk mengatur\nulang kata sandi',
              style: secondaryTextStyle,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.only(
          left: 45,
          right: 45,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kGreyColor,
                  ),
                ),
                hintText: 'Masukan email disini',
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSend() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: CustomeButton(
          text: 'Kirim permintaan',
          onPressed: () {
            Navigator.pushNamed(context, '/forgotsuccess');
          },
          color: kPrimaryColor,
        ),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          content(),
          buttonSend(),
        ],
      ),
    );
  }
}
