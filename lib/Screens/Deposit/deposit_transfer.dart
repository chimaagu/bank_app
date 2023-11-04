import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:flutter/material.dart';

class DepositByTransfer extends StatefulWidget {
  const DepositByTransfer({super.key});

  @override
  State<DepositByTransfer> createState() => _DepositByTransferState();
}

class _DepositByTransferState extends State<DepositByTransfer> {
  TextStyles textStyles = TextStyles();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                child:
                    popButton(Icons.arrow_back_ios_new, context, Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                "Hello Fernandes 👋",
                style: textStyles.appBarStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "This account number provided to you is unique to your OUR account.",
                style: textStyles.normalTextStyle.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                "Any money sent to it will be available to you on your OUR balance.",
                style: textStyles.normalTextStyle.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                "Bank Account Number: ",
                style: textStyles.normalTextStyle.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
