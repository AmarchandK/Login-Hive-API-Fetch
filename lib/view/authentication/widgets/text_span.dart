import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../helpers/refactoring.dart';

class TextspanAuth extends StatelessWidget {
  const TextspanAuth({
    Key? key,
    required this.onTap,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: GoogleFonts.akayaKanadaka(
          fontSize: 20,
          color: bColor,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: GoogleFonts.akayaKanadaka(
              fontSize: 20,
              color: lightGreen,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
