import 'package:clover/provider/auth_provider.dart';
import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:clover/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpRegisterPage extends StatefulWidget {
  final String? email;
  final String? otpCode;

  const OtpRegisterPage({
    Key? key,
    this.email,
    this.otpCode,
  }) : super(key: key);

  @override
  State<OtpRegisterPage> createState() => _OtpRegisterPageState();
}

class _OtpRegisterPageState extends State<OtpRegisterPage> {
  String verifyCode = '';
  final TextEditingController otpController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    verify() async {
      bool? register = await authProvider.otpVerify(
        email: widget.email!,
        otp: otpController.text,
      );

      if (register ?? false) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kRedColor,
            duration: const Duration(seconds: 3),
            content: const Text(
              'Gagal Register !',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    Widget header() {
      return Column(
        children: [
          Image.asset(
            'assets/mail_sender.png',
            width: 70,
            color: kPrimaryColor,
          ),
          const SizedBox(height: 20),
          Text(
            "Masukan Kode OTP",
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "kami sudah mengirimkan kode Verifikasi Ke\nalamat mail anda silahkan di cek",
            style: blackTextStyle.copyWith(),
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    Widget inputCode() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: CustomTextField(
          hintText: 'Masukan kode disini...',
          imageUrl: 'assets/verification.png',
          color: kPrimaryColor,
          controller: otpController,
        ),
      );
    }

    Widget buttonVerif() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: CustomeButton(
          text: 'Verifikasi',
          color: kPrimaryColor,
          onPressed: verify,
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header(),
          const SizedBox(height: 20),
          inputCode(),
          const SizedBox(height: 20),
          buttonVerif(),
        ],
      ),
    );
  }
}
