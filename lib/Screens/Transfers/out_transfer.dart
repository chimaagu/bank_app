import 'dart:async';

import 'package:bank_app/Provider/DatabaseProvider/db_provider.dart';
import 'package:bank_app/Screens/Home/dashboard.dart';
import 'package:bank_app/Screens/Transfers/transfer_two.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/navigator.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OutTransferPage extends StatefulWidget {
  const OutTransferPage({super.key});

  @override
  State<OutTransferPage> createState() => _OutTransferPageState();
}

class _OutTransferPageState extends State<OutTransferPage> {
  bool isFirstTransactionStage = false;
  TextStyles textStyles = TextStyles();
  bool isLoading = false;
  SharedPreferences? sf;

  TextEditingController amount = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController bank = TextEditingController();

  @override
  void initState() {
    DbProvider().getFirstTransfer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leadingWidth: 60,
        leading: SizedBox.fromSize(
          size: const Size(70, 50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: popButton(Icons.arrow_back_ios_new, context, Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Text(
                  "Amount",
                  style: textStyles.appBarStyle,
                ),
                TextField(
                  controller: amount,
                  style: textStyles.appBarStyle.copyWith(fontSize: 30),
                  decoration: const InputDecoration(
                    hintText: "\$ 0",
                  ),
                ),
                Text(
                  "Balance: \$323.43",
                  style:
                      textStyles.normalTextStyle.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: bank,
                  decoration: InputDecoration(
                    labelText: "Recipient Bank Name",
                    labelStyle: textStyles.normalTextStyle,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: number,
                  decoration: InputDecoration(
                    labelText: "Account number",
                    labelStyle: textStyles.normalTextStyle,
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Account holder",
                    labelStyle: textStyles.normalTextStyle,
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: desc,
                  decoration: InputDecoration(
                    labelText: "Description(optional)",
                    labelStyle: textStyles.normalTextStyle,
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // setState(() {
                      //   isFirstTransactionStage = true;
                      //   isLoading = true;
                      // });
                      // Timer(
                      //   const Duration(seconds: 3),
                      //   () {
                      //     setState(() {
                      //       isLoading = false;
                      //     });
                      showTransactionReview();
                      // },
                      // );
                    },
                    child: isLoading == true
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Continue",
                            style: textStyles.appBarStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showTransactionReview() {
    showModalBottomSheet(
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Transfer Summary",
                    style: TextStyles().appBarStyle,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(ctx);
                    },
                    child: popButton(Icons.close, ctx, Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Ammount:",
                style: textStyles.normalTextStyleBold,
              ),
              const SizedBox(height: 5),
              Text("\$${amount.text}"),
              const SizedBox(height: 5),
              Text(
                "Account number:",
                style: textStyles.normalTextStyleBold,
              ),
              const SizedBox(height: 5),
              Text(number.text),
              const SizedBox(height: 5),
              Text(
                "Account holder:",
                style: textStyles.normalTextStyleBold,
              ),
              const SizedBox(height: 5),
              Text(name.text),
              const SizedBox(height: 5),
              Text(
                "Bank:",
                style: textStyles.normalTextStyleBold,
              ),
              const SizedBox(height: 5),
              Text(bank.text),
              const SizedBox(height: 5),
              Text(
                "Desc:",
                style: textStyles.normalTextStyleBold,
              ),
              const SizedBox(height: 5),
              Text(desc.text),
              const SizedBox(height: 10),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                    showFirstError();
                  },
                  child: Text(
                    "Continue",
                    style: textStyles.appBarStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showFirstError() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: const Text(
              "Oops!!\nYou do not have an international transfer code"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "is required for this transaction to be completed successfully. You can visit any of our nearest branches or contact our online customer care representative with:  for more details of the VAT code for this transaction.",
                style: textStyles.normalTextStyle,
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Try Later"),
              onPressed: () {
                Navigator.pop(ctx);
              },
            ),
            CupertinoDialogAction(
              child: const Text("Have code"),
              onPressed: () {
                Navigator.pop(ctx);
                showEnterCodeDialog();
              },
            )
          ],
        );
      },
    );
  }

  void showEnterCodeDialog() {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      // enableDrag: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Enter Code ",
                      style: TextStyles().appBarStyle,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(ctx);
                      },
                      child: popButton(Icons.close, ctx, Colors.grey),
                    ),
                  ],
                ),
                const TextField(),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isFirstTransactionStage = true;
                        isLoading = true;
                      });
                      Timer(
                        const Duration(seconds: 3),
                        () {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pop(ctx);
                          DbProvider()
                              .saveFirstTransfer(isFirstTransactionStage);
                          nextPageAndRemoveUntil(context, const DashBoard());
                        },
                      );
                    },
                    child: Text(
                      "Confirm",
                      style: textStyles.appBarStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
