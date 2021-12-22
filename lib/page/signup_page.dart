import 'dart:convert';

import 'package:clover/widget/bottom_textbutton.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../shared/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  register(username, email, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://api-clover.herokuapp.com/api/register'),
        body: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('login berhasil');

        if (response.body != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Data yang anda masukan salah'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin:
            const EdgeInsets.only(left: 45, right: 45, top: 136, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Belum Punya Akun?,,',
              style: greenTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            Text(
              'Silahkan Daftar',
              style: greenTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Form(
        child: Container(
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
                      color: kPrimaryColor,
                    ),
                  ),
                  hintText: 'username',
                  prefixIcon: Icon(
                    Icons.person,
                    size: 24,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
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
                  hintText: 'email',
                  prefixIcon: Icon(
                    Icons.email,
                    size: 24,
                    color: kPrimaryColor,
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
                  hintText: 'kata sandi',
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 24,
                    color: kPrimaryColor,
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
    Widget buttonLogin() {
      return CustomeButton(
        text: 'Masuk',
        onPressed: () {
          register(
              usernameController.text.toString(),
              emailController.text.toString(),
              passwordController.text.toString());
        },
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
            buttonLogin(),
          ],
        ),
      ),
    );
  }
}
