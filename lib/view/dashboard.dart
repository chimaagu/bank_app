import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/pic.png"),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.menu),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Good morning, Max",
                style: GoogleFonts.andika(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff333A45),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 174,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff171717),
                      Color(0xffF58218),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Quick actions",
                style: GoogleFonts.andika(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff333A45),
                ),
              ),
              const SizedBox(height: 20),
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 43,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 30,
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff282828),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    // height: 43,
                    decoration: BoxDecoration(
                      color: const Color(0xff282828),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    // height: 43,
                    decoration: BoxDecoration(
                      color: const Color(0xff282828),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    // height: 43,
                    decoration: BoxDecoration(
                      color: const Color(0xff282828),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
