import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSuccess extends StatelessWidget {
  const ForgotPasswordSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          children: [
            Icon(
              Icons.mark_email_read,
              size: 100,
              color: kPrimaryColor,
            ),
            const SizedBox(height: 10),
            Text(
              'Silahkan cek email kamu',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'kami telah mengirim kode OTP ke alamat email anda silahkan di buka',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
    }

    Widget buttonOpenEmail() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          children: [
            CustomeButton(
              text: 'Buka Email',
              onPressed: () {
                Navigator.pushNamed(context, '/resetpassword');
              },
              color: kPrimaryColor,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Lain kali'),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            header(),
            buttonOpenEmail(),
          ],
        ),
      ),
    );
  }
}
