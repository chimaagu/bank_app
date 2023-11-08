import 'dart:io';

import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:bank_app/WIdgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DepositByTransfer extends StatefulWidget {
  const DepositByTransfer({super.key});

  @override
  State<DepositByTransfer> createState() => _DepositByTransferState();
}

class _DepositByTransferState extends State<DepositByTransfer> {
  final ImagePicker _picker = ImagePicker();
  TextStyles textStyles = TextStyles();

  File? frontPage;
  File? backPage;

  _getImage1(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        frontPage = imageFile;
      });
    }
  }

  _getImage2(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        backPage = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leadingWidth: 60,
        centerTitle: true,
        title: Text(
          "Cheque Deposit",
          style: TextStyles().appBarStyle.copyWith(color: Colors.white),
        ),
        leading: SizedBox.fromSize(
          size: const Size(70, 50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: popButton(
              Icons.arrow_back_ios_new,
              context,
              Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "you can deposit checks by snapping pictures of the front and back of the check",
                  style: textStyles.normalTextStyle.copyWith(),
                ),
                const SizedBox(height: 20),
                Text(
                  "Cheque amount",
                  style: textStyles.normalTextStyle,
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "2000"),
                ),
                const SizedBox(height: 20),
                Text(
                  "Cheque details",
                  style: textStyles.normalTextStyleBold.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 30),
                Text(
                  "Front of check",
                  style: TextStyles().normalTextStyle,
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    _getImage1(ImageSource.gallery);
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt_rounded,
                            size: 50,
                            color: secondaryColor,
                          ),
                          Text(
                            "tap to choose image",
                            style: TextStyles().normalTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                frontPage == null
                    ? const SizedBox()
                    : Image.file(
                        frontPage!,
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                      ),
                const SizedBox(height: 30),
                Text(
                  "Back of check",
                  style: TextStyles().normalTextStyle,
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    _getImage2(ImageSource.gallery);
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt_rounded,
                            size: 50,
                            color: secondaryColor,
                          ),
                          Text(
                            "tap to choose image",
                            style: TextStyles().normalTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                backPage == null
                    ? const SizedBox()
                    : Image.file(
                        backPage!,
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                      ),
                Text(
                  "Note: our Flash fund fee will be deducted from your account following the completion of this deposit.",
                  style: TextStyles().normalTextStyle.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 30),
                CustomButtom(
                  text: "Proceed",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
