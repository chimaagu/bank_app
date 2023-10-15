import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActionButton extends StatelessWidget {
  final String label;
  final String? image;
  const QuickActionButton({
    super.key,
    required this.label,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == "" ? const SizedBox() : Image.asset(image!),
            const SizedBox(width: 15),
            Text(
              label,
              style: GoogleFonts.andika(
                fontSize: 15,
                color: Colors.white,
              ),
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
              Text(
                name!,
                style: GoogleFonts.andika(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subText!,
                style: GoogleFonts.andika(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
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
