import 'package:flutter/material.dart';

class CustomeTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap; // For handling tap event
  final ValueChanged<String>? onChanged; // For handling text change event
  final bool? obscureText;

  const CustomeTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ??false,
      controller: controller,
      onTap: onTap, // Pass the onTap callback
      onChanged: onChanged, // Pass the onChanged callback
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
