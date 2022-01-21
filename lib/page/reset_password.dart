import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 100,
          left: 45,
          right: 45,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buat password baru',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Pastikan kata sandi yang baru tidak sama dengan kata sandi sebelumnya',
              style: secondaryTextStyle,
            ),
            const SizedBox(height: 50)
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
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
                hintText: 'Email',
                prefixIcon: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Icon(
                    Icons.email,
                    size: 24,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        padding: const EdgeInsets.only(
          left: 45,
          right: 45,
        ),
        child: Column(
          children: [
            TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kGreyColor,
                  ),
                ),
                hintText: 'Kata sandi',
                prefixIcon: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Icon(
                    Icons.lock,
                    size: 25,
                    color: kPrimaryColor,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _isObscure = !_isObscure;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput2() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        padding: const EdgeInsets.only(
          left: 45,
          right: 45,
        ),
        child: Column(
          children: [
            TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kGreyColor,
                  ),
                ),
                hintText: 'ketik ulang Kata sandi',
                prefixIcon: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Icon(
                    Icons.lock,
                    size: 25,
                    color: kPrimaryColor,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _isObscure = !_isObscure;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget sendButton() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: CustomeButton(
          text: 'Kirim',
          onPressed: () {},
          color: kPrimaryColor,
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          emailInput(),
          passwordInput(),
          passwordInput2(),
          sendButton(),
        ],
      ),
    );
  }
}
