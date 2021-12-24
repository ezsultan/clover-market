// ignore_for_file: unused_import

import 'package:clover/provider/auth_provider.dart';
import 'package:clover/widget/bottom_textbutton.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      bool? register = await authProvider.register(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (register ?? false) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
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
      return Container(
        margin: const EdgeInsets.only(
          left: 45,
          right: 45,
          top: 100,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icon_wortel.png',
                width: 50,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              'Silahkan Daftar',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            Text(
              'Silahkan daftar terlebih dahulu',
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        padding: const EdgeInsets.only(
          left: 45,
          right: 45,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kSecondaryColor,
                  ),
                ),
                hintText: 'Username',
                prefixIcon: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Icon(
                    Icons.person,
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

    // ini adalah widget untuk menampilkan field berupa inputan
    Widget emailInput() {
      return Form(
        child: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 45,
            right: 45,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  hintText: 'Email',
                  prefixIcon: Container(
                    margin: EdgeInsets.only(bottom: 10),
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
        ),
      );
    }

    Widget passwordInput() {
      return Form(
        child: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 45,
            right: 45,
            bottom: 50,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  hintText: 'Kata sandi',
                  prefixIcon: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.lock,
                      size: 24,
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
        ),
      );
    }

    // ini adalah wodget untuk tombol masuk
    Widget buttonRegister() {
      return CustomeButton(
        text: 'Daftar',
        onPressed: handleSignUp,
      );
    }

    //Widget for all content
    return Scaffold(
      bottomNavigationBar: BottomTextButton(
        text: 'Sudah punya akun? masuk',
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/login',
          );
        },
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            nameInput(),
            emailInput(),
            passwordInput(),
            buttonRegister(),
          ],
        ),
      ),
    );
  }
}
