import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Texts extends StatelessWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;

  const Texts({
    Key? key,
    required this.myController,
    this.hintText,
    this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: isPassword == true,
        controller: myController,
        decoration: InputDecoration(
          suffixIcon: isPassword == true
              ? IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.eye,
              color: Colors.grey,
            ),
          )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white70,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
