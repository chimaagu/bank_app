import 'package:bank_app/Utils/pop_button.dart';
import 'package:flutter/material.dart';

class InAppTransfer extends StatefulWidget {
  const InAppTransfer({super.key});

  @override
  State<InAppTransfer> createState() => _InAppTransferState();
}

class _InAppTransferState extends State<InAppTransfer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
