import 'package:bank_app/Screens/AuthView/login_page.dart';
import 'package:bank_app/Screens/AuthView/sign_up_2.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextStyles textStyles = TextStyles();
  @override
  Widget build(BuildContext context) {
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
                  Image.asset("images/logo.png"),
                  Text("Register",
                      style: textStyles.appBarStyle.copyWith(color: Colors.white, fontSize: 30)),
                  const SizedBox(height: 10),
                  Text(
                    "Kindly provide the information requested below to enable us create an account for you.",
                    style: textStyles.normalTextStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: textStyles.normalTextStyleBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      TextField(
                        style:
                            textStyles.normalTextStyle.copyWith(color: Colors.white, fontSize: 12),
                        decoration: InputDecoration(
                          hintText: "example@gmail.com",
                          hintStyle:
                              textStyles.normalTextStyle.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Phone Number",
                        style: textStyles.normalTextStyleBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "phone number",
                          hintStyle:
                              textStyles.normalTextStyle.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 30),

                      const SizedBox(height: 30),
                      Text(
                        "Full name",
                        style: textStyles.normalTextStyleBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:  InputDecoration(
                          hintText: "fernandes",
                          hintStyle:
                          textStyles.normalTextStyle.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Date of Birth",
                        style: textStyles.normalTextStyleBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),

                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:  InputDecoration(
                          hintText: "12/11/2020",
                          hintStyle:
                          textStyles.normalTextStyle.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),

                      const SizedBox(height: 30),
                      Text(
                        "State",
                        style: textStyles.normalTextStyleBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:  InputDecoration(
                          hintText: "Lagos",
                          hintStyle:
                          textStyles.normalTextStyle.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "City",
                        style: textStyles.normalTextStyleBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:  InputDecoration(
                          hintText: "Ikeja",
                          hintStyle:
                          textStyles.normalTextStyle.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Country",
                        style: textStyles.normalTextStyleBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:  InputDecoration(
                          hintText: "Ikeja",
                          hintStyle:
                          textStyles.normalTextStyle.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignUpPage2(),
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
                          style: GoogleFonts.poppins(
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
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
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
