// ignore_for_file: unused_import, unused_field

import 'package:clover/page/custom_text_button.dart';
import 'package:clover/page/otp_register_page.dart';
import 'package:clover/provider/auth_provider.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:clover/widget/custom_password_textfield.dart';
import 'package:clover/widget/custom_tac_button.dart';
import 'package:clover/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      bool? register = await authProvider.register(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (register ?? false) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => OtpRegisterPage(
                email: emailController.text,
              ),
            ),
            (route) => false);
      } else {
        Get.snackbar(
          'Gagal daftar',
          'Pastikan data anda benar',
          icon: Icon(
            Icons.warning,
          ),
          backgroundColor: kRedColor,
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          duration: const Duration(
            seconds: 1,
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 100,
          ),
          const SizedBox(height: 16),
          Text(
            'Silahkan daftar',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Masukan data anda',
            style: greyTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      );
    }

    Widget content() {
      Widget inputUsername() {
        return CustomTextField(
          imageUrl: 'assets/icon_user.png',
          hintText: 'Nama Pengguna',
          controller: usernameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'silahkan isi username terlebih dahulu';
            }
          },
        );
      }

      Widget inputEmail() {
        return CustomTextField(
          imageUrl: 'assets/icon_email.png',
          hintText: 'Email',
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Silahkan isi email terlebih dahulu';
            }
          },
        );
      }

      Widget inputPassword() {
        return CustomPasswordTextfield(
          imageUrl: 'assets/icon_password.png',
          hintText: 'Kata Sandi',
          obscureText: false,
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Silahkan isi kata sandi terlebih dahulu';
            }
          },
        );
      }

      return Column(
        children: [
          const SizedBox(height: 30),
          inputUsername(),
          const SizedBox(height: 20),
          inputEmail(),
          const SizedBox(height: 20),
          inputPassword(),
        ],
      );
    }

    Widget buttonRegister() {
      return isLoading
          ? CustomeButton(
              text: 'Loading',
              onPressed: () {},
              isLoading: true,
              color: kPrimaryColor,
            )
          : CustomeButton(
              text: 'Daftar',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  handleSignUp();
                }
              },
              isLoading: false,
              color: kPrimaryColor,
            );
    }

    Widget bottomContent() {
      return CustomTacButton(
        text: 'Sudah memiliki akun? ',
        button: 'Masuk',
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                header(),
                content(),
                const SizedBox(height: 30),
                buttonRegister(),
                const Spacer(),
                bottomContent(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
