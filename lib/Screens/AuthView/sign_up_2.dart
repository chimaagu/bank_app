import 'package:bank_app/Screens/AuthView/login_page.dart';
import 'package:bank_app/Screens/AuthView/sign_up_3.dart';
import 'package:bank_app/Screens/Home/dashboard.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage2 extends StatelessWidget {
  const SignUpPage2({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Other Details",
                        style: textStyles.appBarStyle.copyWith(color: Colors.white, fontSize: 25)),
                  ),

                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Occupation",
                          style: textStyles.normalTextStyleBold.copyWith(color: Colors.white)),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "select occupation type",
                          hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Annual income range",
                          style: textStyles.normalTextStyleBold.copyWith(color: Colors.white),),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "Smith",
                          hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Account type",
                          style: textStyles.normalTextStyleBold.copyWith(color: Colors.white)),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "Bryan",
                          hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Account Currency",
                          style: textStyles.normalTextStyleBold.copyWith(color: Colors.white)),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "Nigeria",
                          hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Password",
                          style: textStyles.normalTextStyleBold.copyWith(color: Colors.white)),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Confirm password",
                          style: textStyles.normalTextStyleBold.copyWith(color: Colors.white)),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF58218),
                      ),
                        // #F58218, #1087D0
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const DashBoard(),
                          ),
                        );
                      },
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.andika(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                          text: "Login",
                          style: GoogleFonts.andika(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
