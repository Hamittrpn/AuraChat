import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/screens/Home/home_screen.dart';
import 'package:aura_chat/screens/Login/login_screen.dart';
import 'package:aura_chat/screens/SignUp/components/background.dart';
import 'package:aura_chat/screens/SignUp/components/or_divider.dart';
import 'package:aura_chat/screens/SignUp/components/social_icons.dart';
import 'package:aura_chat/components/already_have_an_account_check.dart';
import 'package:aura_chat/components/aura_button.dart';
import 'package:aura_chat/components/rounded_input_field.dart';
import 'package:aura_chat/components/rounded_password_field.dart';
import 'package:aura_chat/constants.dart';
import 'package:aura_chat/validations/signup_validation.dart';
import 'package:aura_chat/viewmodels/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final Widget child;

  Body({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _validationService = Provider.of<SignupValidation>(context);

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
              errorText: _validationService.email.error,
              hintText: "Your Email",
              onChanged: (value) {
                _validationService.checkValidEmail(value);
                _email = value;
              },
            ),
            RoundedPasswordField(
              errorText: _validationService.password.error,
              onChanged: (value) {
                _validationService.checkValidPassword(value);
                _password = value;
              },
            ),
            AuraButton(
              text: "SIGN UP",
              color: (!_validationService.isValid)
                  ? Colors.grey[400]
                  : kPrimaryColor,
              press: (!_validationService.isValid)
                  ? null
                  : () => _formSubmit(context),
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
                  press: () => _signInWithFacebook(context),
                ),
                SocialIcon(
                  iconSrc: "lib/assets/icons/twitter.svg",
                  press: () => _guestSignIn(context),
                ),
                SocialIcon(
                  iconSrc: "lib/assets/icons/google-plus.svg",
                  press: () => _signInWithGoogle(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _guestSignIn(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);

    AuraUser _user = await _userViewModel.signInAnonymusly();
    print("Login Id: " + _user.userID.toString());
  }

  void _signInWithGoogle(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    AuraUser _user = await _userViewModel.signInWithGoogle();
    if (_user != null)
      print("Oturum açan user id : " + _user.userID.toString());
  }

  void _signInWithFacebook(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    AuraUser _user = await _userViewModel.signInWithFacebook();
    if (_user != null)
      print("Oturum açan user id : " + _user.userID.toString());
  }

  void _formSubmit(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    await _userViewModel.createUserWithEmail(_email, _password);
  }
}
