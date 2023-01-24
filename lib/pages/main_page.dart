import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:tap_it/auth_page.dart';
//import 'package:tap_it/home_page.dart';
//import 'package:tap_it/pages/auth_page.dart';
import 'package:tap_it/pages/home_page.dart';
import 'package:tap_it/signup_page.dart';
//import 'package:tap_it/verify_email.dart';
//import 'package:tap_it/main.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return const HomePage();
          } else {
            return const SignUpPage();
          }
        },
      ),
    );
  }

}


//       Scaffold(
//     body: StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Something went wrong'));
//         } else if (snapshot.hasData) {
//           return const VerifyEmailPage();
//         } else {
//           return const AuthPage();
//         }
//       },
//     ),
//   );
// }