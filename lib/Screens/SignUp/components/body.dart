import 'package:aura_chat/Models/user_model.dart';
import 'package:aura_chat/Screens/Login/login_screen.dart';
import 'package:aura_chat/Screens/SignUp/components/background.dart';
import 'package:aura_chat/Screens/SignUp/components/or_divider.dart';
import 'package:aura_chat/Screens/SignUp/components/social_icons.dart';
import 'package:aura_chat/Services/auth_base.dart';
import 'package:aura_chat/components/already_have_an_account_check.dart';
import 'package:aura_chat/components/aura_button.dart';
import 'package:aura_chat/components/rounded_input_field.dart';
import 'package:aura_chat/components/rounded_password_field.dart';
import 'package:aura_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  final Widget child;
  final AuthBase authService;

  const Body({
    Key key,
    @required this.child,
    this.authService,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGN UP",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'lib/assets/icons/signup.svg',
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            AuraButton(
              text: "SIGN UP",
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  iconSrc: "lib/assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "lib/assets/icons/twitter.svg",
                  press: _guestSignUp,
                ),
                SocialIcon(
                  iconSrc: "lib/assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _guestSignUp() async {
    AuraUser _user = await authService.signInAnonymusly();
    print("Login Id: " + _user.UserID.toString());
  }
}
