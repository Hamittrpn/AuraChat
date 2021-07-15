import 'package:flutter/material.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'lib/assets/icons/user_Icon.svg',
            text: "My Account",
            press: () {},
          ),
          ProfileMenu(
            icon: 'lib/assets/icons/bell.svg',
            text: "Notifications",
            press: () {},
          ),
          ProfileMenu(
            icon: 'lib/assets/icons/settings.svg',
            text: "Settings",
            press: () {},
          ),
          ProfileMenu(
            icon: 'lib/assets/icons/question_mark.svg',
            text: "Help Center",
            press: () {},
          ),
          ProfileMenu(
            icon: 'lib/assets/icons/logout.svg',
            text: "Log Out",
            press: () {},
          ),
        ],
      ),
    );
  }
}
