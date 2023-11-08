import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Button extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  const Button({super.key, this.buttonText, this.buttonColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(width: 1,color: Colors.white10),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(buttonText!,style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),),
          ),
        ),
      ),
    );

  }
}
