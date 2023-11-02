import 'package:flutter/material.dart';

InkWell popButton(IconData icon, BuildContext context, Color color) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Icon(
          icon,
          color: color,
        ),
      ),
    ),
  );
}
