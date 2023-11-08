import 'dart:async';

import 'package:bank_app/Provider/DatabaseProvider/db_provider.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInputPage extends StatefulWidget {
  VoidCallback? onTap;
  PinInputPage({super.key, this.onTap});

  @override
  State<PinInputPage> createState() => _PinInputPageState();
}

class _PinInputPageState extends State<PinInputPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 40,
                    child: popButton(
                      Icons.arrow_back_ios_new,
                      context,
                      Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                Text(
                  "Enter your OUR pin",
                  style: TextStyles().appBarStyle,
                ),
                const SizedBox(height: 50),
                buildPinPut(),
                const SizedBox(height: 50),
                isLoading == true
                    ? const CircularProgressIndicator(color: secondaryColor)
                    : const SizedBox(),
                const Spacer(),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: widget.onTap,
                    child: Text(
                      "Continue",
                      style: TextStyles().normalTextStyleBold.copyWith(color: secondaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPinPut() {
    return Pinput(
      keyboardType: TextInputType.number,
      animationCurve: Curves.easeIn,
      mainAxisAlignment: MainAxisAlignment.center,
      onCompleted: (pin) {
        DbProvider().saveTransferPin(pin);
      },
    );
  }
}
