import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:flutter/material.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({super.key});

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  bool isSelected = false;
  int selectedIndex = 0;
  List genders = [
    "Male",
    "Female",
    "Others",
  ];

  TextStyles textStyles = TextStyles();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Withdraw Funds",
          style: TextStyles().appBarStyle.copyWith(color: Colors.white),
        ),
        leading: SizedBox.fromSize(
          size: const Size(70, 50),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: popButton(Icons.arrow_back_ios_new, context, Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            TextField(
              // controller: bank,
              decoration: InputDecoration(
                labelText: "Full name",
                labelStyle: textStyles.normalTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              // controller: bank,
              decoration: InputDecoration(
                labelText: "Fathers name",
                labelStyle: textStyles.normalTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              // controller: bank,
              decoration: InputDecoration(
                labelText: "Mothers name",
                labelStyle: textStyles.normalTextStyle,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Select gender",
              style: textStyles.appBarStyle,
            ),
            ListView.builder(
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: genders.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: selectedIndex != index
                            ? Colors.white
                            : primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Text(
                      genders[index],
                      style: textStyles.normalTextStyle.copyWith(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt_rounded,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "NID",
                  style: textStyles.appBarStyle,
                ),
                const SizedBox(height: 30),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Continue",
                style: textStyles.appBarStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
