import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:tap_it/camera_page.dart';
import 'package:tap_it/pages/main_page.dart';
import 'package:tap_it/pages/onboarding_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_it/utils.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class BackGround {
  bool success = false;
  bool background = false;
  Future<void> _runbackgroundApp() async {
    try {
      //BACKGROUND RUNNER
      const androidConfig = FlutterBackgroundAndroidConfig(
        notificationTitle: "Tap It",
        notificationText: "This app is running in the background...",
        notificationImportance: AndroidNotificationImportance.Default,
        notificationIcon:
            AndroidResource(name: 'ic_launcher', defType: 'mipmap'),
        enableWifiLock: true,
      );
      background =
          await FlutterBackground.initialize(androidConfig: androidConfig);
      if (background) {
        if (!FlutterBackground.isBackgroundExecutionEnabled) {
          success = await FlutterBackground.enableBackgroundExecution();
          print("Running");
        }
      }
    } catch (e) {
      print("Background Process Error:" + e.toString());
    } ////END BACKGROUND RUNNER
  }
}

//final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
            brightness: Brightness.light,
            primarySwatch: Colors.cyan),
        //darkTheme: ThemeData(brightness: Brightness.light),
        //themeMode: ThemeMode.system,
        scaffoldMessengerKey: Utils.messengerKey,
        //navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute:
            initScreen == 0 || initScreen == null ? 'onboard' : 'home',
        routes: {
          'home': (context) => const MainPage(),
          'onboard': (context) => const OnBoardingPage(),
        });
  }
}

// class SignUpPage extends StatefulWidget {
//   //final Function() onClickedSignIn;
//   const SignUpPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final formKey = GlobalKey<FormState>();
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
//         padding: const EdgeInsets.all(16),
//         child: Scaffold(
//           backgroundColor: Colors.lightBlueAccent,
//           body: Form(
//             key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 40),
//                 Image.asset(
//                   "assets/images/tapit2.png",
//                   height: 100,
//                   width: 100,
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   'Hi There!!!',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Sign Up below with your details',
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   cursorColor: Colors.white,
//                   textInputAction: TextInputAction.next,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (email) =>
//                       email != null && !EmailValidator.validate(email)
//                           ? 'Enter a valid email'
//                           : null,
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: passwordController,
//                   cursorColor: Colors.white,
//                   textInputAction: TextInputAction.next,
//                   decoration: const InputDecoration(labelText: 'Password'),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) => value != null && value.length < 6
//                       ? 'Enter min. of 6 characters'
//                       : null,
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 40),
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                   ),
//                   icon: const Icon(Icons.arrow_forward, size: 32),
//                   label: const Text(
//                     'Sign Up',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   onPressed: signUp,
//                 ),
//                 // const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       );
//
//   Future signUp() async {
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

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//
//   final emailController = TextEditingController();
//    final passwordController = TextEditingController();
//
//    @override
//    void dispose() {
//
//      emailController.dispose();
//      passwordController.dispose();
//
//      super.dispose();
//    }
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
//}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   static const String title = 'Firebase Auth';

// @override
// Widget build(BuildContext context) => Scaffold(
//     body: StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Something went wrong'));
//         } else if (snapshot.hasData) {
//           return const HomePage();
//         } else {
//           return const LoginWidget();
//         }
//       },
//     ));
// ) {
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       textTheme: GoogleFonts.latoTextTheme(),
//       // primarySwatch: Colors.blue,
//     ),
//     initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
//     routes: {
//       'home': (context) => const LoginWidget(),
//       'onboard': (context) => const OnBoardingPage(),
//     },
//   );
// }
//}

// final messengerKey = GlobalKey<ScaffoldMessengerState>();
//  class Utils {
//   static showSnackBar(String? text) {
//     if (text == null) return;
//     final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
//     messengerKey.currentState!
//     ..removeCurrentSnackBar()
//     ..showSnackBar(snackBar);
//   }
//  }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
