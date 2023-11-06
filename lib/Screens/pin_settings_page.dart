import 'package:bank_app/Provider/DatabaseProvider/db_provider.dart';
import 'package:bank_app/Screens/Transfers/pin_input_page.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/navigator.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  var pin;

  @override
  void initState() {
    pin = DbProvider().getTransferPin();
    super.initState();
  }

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
                child: popButton(Icons.arrow_back_ios_new, context, Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                "Account pin setting",
                style: TextStyles().appBarStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 30),
              ListTile(
                title: Text(
                  pin == null ? "Set pin" : "Change pin",
                  style: TextStyles().normalTextStyle,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                onTap: () {
                  nextPage(context,  PinInputPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
