import 'package:bank_app/Provider/auth_provider.dart';
import 'package:bank_app/Screens/AuthView/login_page.dart';
import 'package:bank_app/Screens/Home/dashboard.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage2 extends StatefulWidget {
  final String email;
  final String phone;
  final String name;
  final String dob;
  final String country;

  const SignUpPage2(
      {super.key,
      required this.email,
      required this.phone,
      required this.name,
      required this.dob,
      required this.country});

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  TextEditingController accountType = TextEditingController();
  TextEditingController currency = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController occupation = TextEditingController();

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
                    child: Text(
                      "Other Details",
                      style: textStyles.appBarStyle.copyWith(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Occupation",
                          style: textStyles.normalTextStyleBold
                              .copyWith(color: Colors.white)),
                      TextField(
                        cursorColor: secondaryColor,
                        controller: occupation,
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "select occupation type",
                          hintStyle: textStyles.normalTextStyle
                              .copyWith(color: Colors.grey),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Account type",
                          style: textStyles.normalTextStyleBold
                              .copyWith(color: Colors.white)),
                      TextField(
                        cursorColor: secondaryColor,
                        controller: accountType,
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "Bryan",
                          hintStyle: textStyles.normalTextStyle
                              .copyWith(color: Colors.grey),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Account Currency",
                          style: textStyles.normalTextStyleBold
                              .copyWith(color: Colors.white)),
                      TextField(
                        cursorColor: secondaryColor,
                        controller: currency,
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "Nigeria",
                          hintStyle: textStyles.normalTextStyle
                              .copyWith(color: Colors.grey),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Password",
                          style: textStyles.normalTextStyleBold
                              .copyWith(color: Colors.white)),
                      TextField(
                        cursorColor: secondaryColor,
                        controller: password,
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textStyles.normalTextStyle
                              .copyWith(color: Colors.grey),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Confirm password",
                          style: textStyles.normalTextStyleBold
                              .copyWith(color: Colors.white)),
                      TextField(
                        cursorColor: secondaryColor,
                        controller: confirmPassword,
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textStyles.normalTextStyle
                              .copyWith(color: Colors.grey),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child:
                        Consumer<AuthProvider>(builder: (context, auth, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                        ),
                        onPressed: () {
                          if (occupation.text.isEmpty ||
                              accountType.text.isEmpty ||
                              currency.text.isEmpty ||
                              password.text.isEmpty ||
                              confirmPassword.text.isEmpty) {
                            showSnackBar("All fields are required", context);
                          } else {
                            auth.signUp(
                              context: context,
                              nationality: widget.country,
                              email: widget.email,
                              currency: currency.text,
                            );
                          }
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //     builder: (context) => const DashBoard(),
                          //   ),
                          // );
                        },
                        child: auth.isLoading
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                "Continue",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                      );
                    }),
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
                            color: secondaryColor,
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
