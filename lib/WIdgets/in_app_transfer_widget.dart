import 'dart:async';

import 'package:bank_app/Screens/Transfers/in_app_transfer.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:bank_app/WIdgets/custom_button.dart';
import 'package:flutter/material.dart';

class InAppTransferWidget extends StatefulWidget {
  final BuildContext context;
  const InAppTransferWidget({super.key, required this.context});

  @override
  State<InAppTransferWidget> createState() => _InAppTransferWidgetState();
}

class _InAppTransferWidgetState extends State<InAppTransferWidget> {
  bool isVerified = false;
  bool isLoading = false;

  verify() {
    setState(() {
      isLoading = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isVerified = true;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                popButton(Icons.close, context, Colors.black),
              ],
            ),
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              backgroundImage: isVerified != false
                  ? const AssetImage("images/wife.png")
                  : null,
              child: isVerified == false
                  ? const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(height: 5),
            isVerified == true
                ? Text(
                    "Fernandes mich",
                    style: TextStyles().normalTextStyle,
                  )
                : const Text(""),
            const SizedBox(height: 30),
            TextField(
              cursorColor: primaryColor,
              style: TextStyles().appBarStyle.copyWith(fontSize: 25),
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixText: "@",
                hintText: "username",
                hintStyle: TextStyles().appBarStyle.copyWith(
                      fontSize: 25,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButtom(
              text: isLoading == true
                  ? "Verifying.."
                  : isVerified == true
                      ? "Continue"
                      : "Verify",
              onTap: () {
                isVerified != true
                    ? verify()
                    : showTransferPage(widget.context);
              },
            ),
          ],
        ),
      ),
    );
  }

  showTransferPage(BuildContext ctx) {
    Navigator.pop(ctx);
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      builder: (ctx) {
        return const InAppTransfer();
      },
    );
  }
}
