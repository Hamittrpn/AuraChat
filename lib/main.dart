import 'package:aura_chat/Screens/Welcome/welcome_screen.dart';
import 'package:aura_chat/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Container(
              child: Text("Check for errors"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "Aura",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: WelcomeScreen(),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

    // return MaterialApp(
    //   title: "Aura",
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primaryColor: kPrimaryColor,
    //     scaffoldBackgroundColor: Colors.white,
    //   ),
    //   home: WelcomeScreen(),
    // );
