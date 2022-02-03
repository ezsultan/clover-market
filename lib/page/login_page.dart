// ignore_for_file: unnecessary_import

import 'package:clover/page/custom_text_button.dart';
import 'package:clover/provider/auth_provider.dart';
import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:clover/widget/custom_button_oauth.dart';
import 'package:clover/widget/custom_password_textfield.dart';
import 'package:clover/widget/custom_tac_button.dart';
import 'package:clover/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      bool? register = await authProvider.login(
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
        Get.snackbar(
          'Gagal',
          'Kredensial anda salah',
          icon: const Icon(
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
      setState(
        () {
          isLoading = false;
        },
      );
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
            'Selamat datang Clover',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Login untuk melanjutkan',
            style: greyTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      );
    }

    Widget content() {
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
          inputEmail(),
          const SizedBox(height: 20),
          inputPassword(),
        ],
      );
    }

    Widget buttonLogin() {
      return isLoading
          ? CustomeButton(
              text: 'Loading',
              onPressed: () {},
              isLoading: true,
              color: kPrimaryColor,
            )
          : CustomeButton(
              text: 'Masuk',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  handleSignIn();
                }
              },
              isLoading: false,
              color: kPrimaryColor,
            );
    }

    Widget divider() {
      return Row(children: [
        const Expanded(
          child: Divider(),
        ),
        const SizedBox(width: 20),
        Text(
          'OR',
          style: greyTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: Divider(),
        ),
      ]);
    }

    Widget buttonOauth() {
      Widget buttonGoogle() {
        return CustomButtonOauth(
          text: '   Masuk dengan google',
          onPressed: () {},
          imageUrl: 'assets/icon_google.png',
        );
      }

      Widget buttonFacebook() {
        return CustomButtonOauth(
          text: 'Masuk dengan facebook',
          onPressed: () {},
          imageUrl: 'assets/icon_facebook.png',
        );
      }

      return Column(
        children: [
          buttonGoogle(),
          const SizedBox(height: 8),
          buttonFacebook(),
        ],
      );
    }

    Widget bottomContent() {
      Widget forgotPasswordButton() {
        return const CustomTextButton(
          text: 'Lupa kata sandi',
        );
      }

      Widget tacButton() {
        return CustomTacButton(
          text: 'Belum memiliki akun? ',
          button: 'Daftar',
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
        );
      }

      return Column(
        children: [
          const SizedBox(height: 16),
          forgotPasswordButton(),
          const SizedBox(height: 8),
          tacButton(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                header(),
                const SizedBox(height: 30),
                content(),
                const SizedBox(height: 20),
                buttonLogin(),
                const SizedBox(height: 20),
                divider(),
                const SizedBox(height: 20),
                buttonOauth(),
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
