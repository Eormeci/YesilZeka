import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildButton(IconData icon, String label, VoidCallback onPressed) {
  return Container(
    width: 80,
    height: 70,
    margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),

    child: Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    ),
  );
}
