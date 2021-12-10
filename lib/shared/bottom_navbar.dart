import 'package:clover/shared/theme.dart';
import 'package:clover/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        boxShadow: [
          BoxShadow(
              color: kPrimaryColor.withOpacity(0.5),
              blurRadius: 50,
              offset: const Offset(0, 10))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CustomBottomNavbar(
            imageUrl: 'assets/home.png',
            route: '/home',
            title: 'beranda',
          ),
          CustomBottomNavbar(
            imageUrl: 'assets/bag.png',
            route: '/product',
            title: 'belanja',
          ),
          CustomBottomNavbar(
            imageUrl: 'assets/transaction.png',
            route: '/transaction',
            title: 'transaksi',
          ),
          CustomBottomNavbar(
            imageUrl: 'assets/profile.png',
            route: '/profile',
            title: 'profil',
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// class BottomNavbar extends StatefulWidget {
//   const BottomNavbar({Key? key}) : super(key: key);

//   @override
//   _BottomNavbarState createState() => _BottomNavbarState();
// }

// class _BottomNavbarState extends State<BottomNavbar> {
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     Widget buildBottomNavbar() {
//       return BottomNavyBar(
//         onItemSelected: (index) => setState(() => this.index = index),
//         items: <BottomNavyBarItem>[
//           BottomNavyBarItem(
//             icon: Icon(Icons.home),
//             title: Text('home'),
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.home),
//             title: Text('home'),
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.home),
//             title: Text('home'),
//           ),
//         ],
//       );
//     }

//     return Scaffold();
//   }
// }
