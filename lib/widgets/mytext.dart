import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  const MyText({
    super.key,
    required this.text,
    required this.fontSize,
    this.textAlign,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.secularOne(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
