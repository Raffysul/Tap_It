// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:tap_it/main.dart';
// import 'package:tap_it/utils.dart';
//
// class LoginWidget extends StatefulWidget {
//   final VoidCallback onClickedSignUp;
//
//   const LoginWidget({
//     Key? key,
//     required this.onClickedSignUp,
//   }) : super(key: key);
//
//   @override
//   State<LoginWidget> createState() => _LoginWidgetState();
// }
//
// class _LoginWidgetState extends State<LoginWidget> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     emailController.dispose();
//     passwordController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => SingleChildScrollView(
//     padding: const EdgeInsets.all(16),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const SizedBox(height: 40),
//         TextField(
//           controller: emailController,
//           cursorColor: Colors.white,
//           textInputAction: TextInputAction.next,
//           decoration: const InputDecoration(labelText: 'Email'),
//         ),
//         const SizedBox(height: 4),
//         TextField(
//           controller: passwordController,
//           textInputAction: TextInputAction.done,
//           decoration: const InputDecoration(labelText: 'Password'),
//           obscureText: true,
//         ),
//         const SizedBox(height: 20),
//         ElevatedButton.icon(
//           style: ElevatedButton.styleFrom(
//             minimumSize: const Size.fromHeight(50),
//           ),
//           icon: const Icon(Icons.lock_open, size: 32),
//           label: const Text(
//             'Sign In',
//             style: TextStyle(fontSize: 20),
//           ),
//           onPressed: signIn,
//         ),
//         const SizedBox(height: 24),
//         RichText(
//           text: TextSpan(
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//             text: 'No account?  ',
//             children: [
//               TextSpan(
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = widget.onClickedSignUp,
//                 text: 'Sign Up',
//                 style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     color: Theme.of(context).colorScheme.secondary),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
//
//   Future signIn() async {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const Center(child: CircularProgressIndicator()),
//     );
//
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e);
//
//       Utils.showSnackBar(e.message);
//     }
//     navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }
// }
