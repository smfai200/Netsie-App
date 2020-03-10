import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/colors.dart';

TextStyle userNameTextStyle = TextStyle(
  fontSize: 32,
  color: primaryTextColor,
  fontWeight: FontWeight.w500
);

TextStyle rankTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.bold
);

TextStyle hoursPlayedLabelTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.bold,
);

TextStyle hoursPlayedTextStyle = TextStyle(
  fontSize: 28,
  color: secondaryTextColor,
  fontWeight: FontWeight.normal,
);

TextStyle headingOneTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

TextStyle headingTwoTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey.shade900,
  fontWeight: FontWeight.bold,
);

TextStyle bodyTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey.shade600,
);

TextStyle newGameTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w700
);

TextStyle newGameNameTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
    fontWeight: FontWeight.w700
);

TextStyle playWhiteTextStyle = TextStyle(
    fontSize: 14,
    color: firstColor,
    fontWeight: FontWeight.w700
);


class Style {
  static final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
  );
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 14.0,
      fontWeight: FontWeight.w400
  );
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
  );
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w400
  );
}