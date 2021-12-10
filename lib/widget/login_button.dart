// import 'package:flutter/material.dart';


// class LoginButton extends StatelessWidget {
//   const LoginButton({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// //loading spinner on button
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 70,
//           width: MediaQuery.of(context).size.width,
//           alignment: Alignment.center,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//             onPressed: () async {
//               setState(() {
//                 isLoading = true;
//               });
//               await Future.delayed(const Duration(seconds: 5));
//               setState(() {
//                 isLoading = false;
//               });
//             },
//             child: (isLoading)
//                 ? const SizedBox(
//                     width: 16,
//                     height: 16,
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                       strokeWidth: 1.5,
//                     ))
//                 : const Text('Submit'),
//           ),
//         ),
//       ),
//     );
//   }
// }
