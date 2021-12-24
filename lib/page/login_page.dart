import 'package:clover/provider/auth_provider.dart';
import 'package:clover/shared/custom_tac.dart';
import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: const Text('Data yang anda masukan salah'),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
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
              'Login',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            Text(
              'Masukan email dan password',
              style: greenTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    // ini adalah widget untuk menampilkan field berupa inputan
    Widget emailInput() {
      return Container(
        padding: const EdgeInsets.only(
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
              controller: passwordController,
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

    Widget forgotPassword() {
      return Container(
        margin: const EdgeInsets.only(right: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTac(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              text2: 'Lupa kata sandi?',
            ),
          ],
        ),
      );
    }

    Widget buttonLogin() {
      return isLoading
          ? CustomeButton(
              text: 'Loading',
              onPressed: () {},
              isLoading: true,
            )
          : CustomeButton(
              text: 'Masuk',
              onPressed: handleSignIn,
              isLoading: false,
            );
    }

    Widget signIn() {
      return CustomTac(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        text1: 'Belum punya akun? daftar ',
        text2: 'Disini',
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          emailInput(),
          passwordInput(),
          forgotPassword(),
          buttonLogin(),
          const Spacer(),
          signIn()
        ],
      ),
    );
  }
}
