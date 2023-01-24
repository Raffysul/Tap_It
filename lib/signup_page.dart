import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tap_it/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(_title)),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
          child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.phone_android,
              //   size: 100,
              // ),
              const SizedBox(height: 30),
              Image.asset(
                "assets/images/tapit2.png",
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Hi There!!!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign Up below with your details',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              //email textfield
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter min. of 6 characters'
                      : null,
                  obscureText: true,
                ),
              ),

              //text button
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.arrow_forward, size: 32),
                  label: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: signUp,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future signUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
      //Navigator.push(context, CupertinoPageRoute(builder: (context) => CameraPage()));
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
  }

  //Future signUp() async {
//     final isValid = formKey.currentState!.validate();
//     if (!isValid) return;
//
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const CameraPage(),
//       // Navigator.push(context, CupertinoPageRoute(builder: (context) => CameraPage()));
//       //Center(child: CircularProgressIndicator()),
//     );
//
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());
//     } on FirebaseAuthException catch (e) {
//       print(e);
//
//       Utils.showSnackBar(e.message);
//     }
//     navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }
// }
}
