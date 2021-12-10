import 'package:clover/common/constant.dart';
import 'package:clover/model/login_request.dart';
import 'package:clover/model/login_response.dart';
import 'package:clover/network/api_client.dart';
import 'package:clover/shared/theme.dart';
import 'package:clover/widget/bottom_textbutton.dart';
import 'package:clover/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cEmail = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  // ini adalah widget untuk menampilkan logo
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin:
            const EdgeInsets.only(left: 45, right: 45, top: 136, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang,,',
              style: greenTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            Text(
              'Silahkan Login',
              style: greenTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    // ini adalah widget untuk menampilkan field berupa inputan
    Widget emailInput() {
      return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(
            left: 45,
            right: 45,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: _cEmail,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  hintText: 'Alamat Email',
                  prefixIcon: Icon(
                    Icons.email,
                    size: 24,
                    color: kPrimaryColor,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
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
              controller: _cPassword,
              obscureText: _isObscure,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                hintText: 'Kata Sandi',
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ),
      );
    }

    Widget forgotPassword() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: 45,
          right: 45,
          top: 20,
          bottom: 20,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            'Lupa kata sandi? klik',
            style: greyTextStyle,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'disini',
            ),
          )
        ]),
      );
    }

    Widget buttonLogin() {
      return CustomeButton(
        text: 'Masuk',
        onPressed: _login,
      );
    }

    // digunakan untuk mereturn semua widget yang ada pada file login_page.dart
    return Scaffold(
      bottomNavigationBar: BottomTextButton(
        text: 'Belum punya akun? daftar',
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/register',
          );
        },
      ),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          header(),
          emailInput(),
          passwordInput(),
          forgotPassword(),
          buttonLogin(),
        ],
      ),
    );
  }

  Future<void> _login() async {
    // setState(() => _onLoading = true);
    LoginResponse response = await ApiClient.login(
      LoginRequest(
        email: _cEmail.text,
        password: _cPassword.text,
      ),
    );
    if (response.token != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString(AppConstant.loginKey, response.token!);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(
            token: response.token!,
          ),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Data yang anda masukan salah'),
        ),
      );
    }
    // setState(() => _onLoading = false);
  }
}
