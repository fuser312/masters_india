import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final double width;

  CustomContainer({required this.subtitle, required this.title, this.width = .29});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16),),
            SizedBox(height: 8,),
            Text(subtitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
