import 'package:flutter/material.dart';

class AriaCard extends StatelessWidget {
  const AriaCard(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.indigo,

        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
