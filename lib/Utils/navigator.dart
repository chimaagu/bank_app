import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

nextPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => page,
    ),
  );
}

nextPageAndRemoveUntil(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
    context,
    CupertinoPageRoute(
      builder: (context) => page,
    ),
    (route) => false,
  );
}
