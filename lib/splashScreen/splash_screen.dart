// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:tap_it/onboarding_screen.dart';
//
// class MySplashScreen extends StatefulWidget {
//   const MySplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MySplashScreen> createState() => _MySplashScreenState();
// }
//
// class _MySplashScreenState extends State<MySplashScreen> {
//   startTimer() {
//     Timer(const Duration(seconds: 5), () async {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (c) => const OnBoardingScreen()));
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/images/splash3.jpg",
//               fit: BoxFit.fill,
//               alignment: Alignment.center,
//               height: 300,
//               width: 250,
//             ),
//             const SizedBox(height: 50,),
//             const Text(
//               "Just Tap It ",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
