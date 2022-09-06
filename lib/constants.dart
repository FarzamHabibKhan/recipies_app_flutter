import 'package:flutter/material.dart';

const kPrimaryColor1 = Color(0xffF7AD19);
const kPrimaryColor2 = Color(0xff3E9FD1);
const kScaffoldBackgroundColor = Color(0xffFFFDF8);
const kTextColor = Color(0xff002334);
const kNeutralColor = Color(0xffdcdcdc);

const kCardLabelStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16.0,
  color: kTextColor,
);

const kTopBarTextStyle = TextStyle(
  fontFamily: 'Roboto',
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
);

const kShadowStyle = <Shadow>[
  Shadow(
    offset: Offset(2, 2),
    blurRadius: 5.0,
    color: Color.fromARGB(255, 79, 79, 79),
  ),
];

AppBar kAppBarStyle(String title) {
  return AppBar(
    title: Text(
      title,
      style: kTopBarTextStyle,
    ),
    backgroundColor: kPrimaryColor1,
  );
}

const kTextLabelStyle = TextStyle(
  color: kTextColor,
  fontFamily: 'Roboto',
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const kSelectedLine = Divider(
  indent: 50,
  endIndent: 50,
  thickness: 2,
  color: kTextColor,
);
