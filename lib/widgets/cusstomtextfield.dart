import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class customtextfiald extends StatelessWidget {
  customtextfiald(
      {super.key,
      required this.hintText,
      this.onChanged,
      this.obscureText = false,
       this.validator,
      this.icon, });
  final String hintText;
  Function(String)? onChanged;
  dynamic validator;
  bool? obscureText;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: hintText, labelStyle: TextStyle(fontSize: 22),
        prefixIcon: icon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue))
        //  hintText: hintText
        ,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 17, 14, 14), fontSize: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 21, 17, 17))),
        // hintText: hintText
        // ,hintStyle: const TextStyle(color: Colors.white, fontSize: 20)
      ),
    );
  }
}
