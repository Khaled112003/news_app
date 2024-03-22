import 'package:flutter/material.dart';


class custombuttonfield extends StatelessWidget {
   custombuttonfield({super.key, required this.text,  this.onTap});
  final String text;
   VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Color.fromARGB(255, 0, 0, 0)),
              width: double.infinity,
              height: 60,
              child: Center(
                  child: Text(text
                ,
                style: const TextStyle(color: Colors.white, fontSize: 27, ),
              )),
            ),
    );
  }
}