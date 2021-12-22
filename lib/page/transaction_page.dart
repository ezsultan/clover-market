import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tidak ada transaksi',
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
