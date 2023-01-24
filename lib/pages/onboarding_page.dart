import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
//import 'package:tap_it/main.dart';
import 'package:tap_it/signup_page.dart';
// import 'package:tap_it/signup_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'WELCOME TO TAP IT',
          body:
              "This is an app that documents all forms of societal abuse discreetly.",
          image: buildImage("assets/images/tapit1.png"),
          //Center(
          //child: Image.asset("assets/images/tap it 1.png", height: 175.0)),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'YOUR COMMUNITY WHISTLE BLOWING APP',
          body:
              'Reports any criminal or civil unrest activity via your mobile device.',
          image: buildImage("assets/images/tapit3.png"),
          //Center(
          //child: Image.asset("assets/images/tap it 3.png", height: 175.0)),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'JUST A TAP AWAY',
          body:
              'Activate any suitable tapping gesture of your choice to activate the app.',
          image: buildImage("assets/images/tapit2.png"),
          // Center(
          //     child: Image.asset("assets/images/tap it 2.png", height: 175.0)),
          decoration: buildDecoration(),
        ),
      ],
      next: const Icon(
        Icons.navigate_next,
        size: 40,
        color: Colors.black,
      ),
      done: const Text('Done',
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500),
      ), //by default, skip goes to the last page
      onSkip: () => goToHome(context),
      dotsDecorator: getDotDecoration(),
      animationDuration: 1000,
      globalBackgroundColor: Colors.lightBlueAccent.shade400,
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.grey,
      size: const Size(10, 10),
      activeColor: Colors.black,
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  void goToHome(BuildContext context) =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const SignUpPage()));

  Widget buildImage(String path) => Center(child: Image.asset(path));

  PageDecoration buildDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900),
        bodyTextStyle: const TextStyle(fontSize: 15),
        pageColor: Colors.white,
        imagePadding: const EdgeInsets.all(0),
      );
}


