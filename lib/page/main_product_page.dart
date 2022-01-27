// import 'package:clover/page/products_page.dart';
// import 'package:clover/shared/bottom_navbar.dart';
// import 'package:clover/shared/theme.dart';

// import 'package:flutter/material.dart';

// class MainProductPage extends StatelessWidget {
//   const MainProductPage({Key? key, String? token}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Widget buildContent() {
//       return const ();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kBackgroundColor,
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(
//                 context,
//                 '/cart',
//               );
//             },
//             icon: Icon(
//               Icons.shopping_cart,
//               color: kBlackColor,
//             ),
//           )
//         ],
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.navigate_before,
//             color: kBlackColor,
//           ),
//         ),
//         title: Text(
//           'Lengkapi nutrisimu',
//           style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
//         ),
//       ),
//       bottomNavigationBar: const BottomNavbar(),
//       backgroundColor: kBackgroundColor,
//       body: Stack(
//         children: [
//           buildContent(),
//         ],
//       ),
//     );
//   }
// }
