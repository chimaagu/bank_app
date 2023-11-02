import 'package:bank_app/Screens/Transfers/out_transfer.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/navigator.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Transfer to.."),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Transfer to in-app Bank",
              style: TextStyles().normalTextStyleBold,
            ),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          ListTile(
            title: Text(
              "Transfer to other Banks",
              style: TextStyles().normalTextStyleBold,
            ),
            onTap: () {
              nextPage(
                context,
                const OutTransferPage(),
              );
            },
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
