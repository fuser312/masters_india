import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final double width;

  CustomButton({required this.text, required this.ontap, this.width = 0.9});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(text),
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width* width, 48),
          primary: Color(0xff2DA05E),
          textStyle: TextStyle(
              color: Colors.white, fontSize: 16,),
        ));
  }
}
