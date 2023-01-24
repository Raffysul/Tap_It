import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tap_it/camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
//Navigator.push(context, CupertinoPageRoute(builder: (context) => MainPage()));
    return Scaffold(
        backgroundColor: Colors.green.shade100,
        // appBar: AppBar(
        //   title: const Text('Home'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Signed in as:' + user.email!,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              // Text(
              //   user.email!,
              //   style: const TextStyle(
              //       fontSize: 20, fontWeight: FontWeight.normal),
              // ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.arrow_forward, size: 32),
                  label: const Text(
                    'Proceed',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CameraPage();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
