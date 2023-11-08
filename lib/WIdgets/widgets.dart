import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActionButton extends StatelessWidget {
  final String label;
  final IconData? image;
  final VoidCallback? onPressed;
  const QuickActionButton({
    super.key,
    required this.label,
    this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null ? const SizedBox() : Icon(image!, color: Colors.white,),
            const SizedBox(width: 20),
            Text(
              label,
              style: TextStyles()
                  .normalTextStyleBold
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Widget helpCard({
  String? name,
  String? subText,
  String? image,
  VoidCallback? onTap,
  BuildContext? ctx,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    margin: const EdgeInsets.only(bottom: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          blurRadius: 10,
        ),
      ],
    ),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name!, style: TextStyles().normalTextStyleBold),
              const SizedBox(height: 3),
              Text(
                subText!,
                style: TextStyles().normalTextStyle,
              ),
              // Text(
              //   "Transfer to other accounts",
              //   style: GoogleFonts.andika(
              //     fontSize: 13,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 17,
          )
        ],
      ),
    ),
  );
}
