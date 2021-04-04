import 'package:aura_chat/constants.dart';
import 'package:flutter/material.dart';

class AuraButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const AuraButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
