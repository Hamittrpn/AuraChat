import 'package:aura_chat/screens/Welcome/landing_screen.dart';
import 'package:aura_chat/services/locator.dart';
import 'package:aura_chat/constants.dart';
import 'package:aura_chat/validations/signup_validation.dart';
import 'package:aura_chat/viewmodels/user_vm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider<SignupValidation>(
          create: (context) => SignupValidation(),
        ),
      ],
      child: MaterialApp(
          title: "Aura",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: LandingScreen()),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<UserViewModel>(
//       create: (context) => UserViewModel(),
//       child: MaterialApp(
//           title: "Aura",
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             primaryColor: kPrimaryColor,
//             scaffoldBackgroundColor: Colors.white,
//           ),
//           home: LandingScreen()),
//     );
//   }
// }
