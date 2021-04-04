import 'package:aura_chat/Screens/Login/components/background.dart';
import 'package:aura_chat/Screens/SignUp/signup_screen.dart';
import 'package:aura_chat/components/already_have_an_account_check.dart';
import 'package:aura_chat/components/aura_button.dart';
import 'package:aura_chat/components/rounded_input_field.dart';
import 'package:aura_chat/components/rounded_password_field.dart';
import 'package:aura_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'lib/assets/icons/login.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            AuraButton(
              text: "LOGIN",
              color: kPrimaryColor,
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                 }));
              },
            )
          ],
        ),
      ),
    );
  }
}
