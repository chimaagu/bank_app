import 'package:flutter/material.dart';

showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      content: Text(message),
    ),
  );
}
