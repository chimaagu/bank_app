import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:flutter/material.dart';

showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: secondaryColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      content: Text(
        message,
        style: TextStyles().normalTextStyleBold.copyWith(
              color: Colors.white,
            ),
      ),
    ),
  );
}
