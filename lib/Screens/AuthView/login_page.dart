import 'package:bank_app/Screens/AuthView/sign_up_1.dart';
import 'package:bank_app/Screens/Home/dashboard.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyles  textStyles = TextStyles();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/logo.png"),
                Text(
                  "Welcome back 👏",
                  style: textStyles.appBarStyle.copyWith(fontSize: 30, color: Colors.white)
                ),
                const SizedBox(height: 10),
                Text(
                  "Login",
                  style: textStyles.appBarStyle.copyWith(color: Colors.white)
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: textStyles.normalTextStyle.copyWith(color: Colors.white),
                    ),
                    TextField(
                      style:  textStyles.normalTextStyle.copyWith(color: Colors.white),
                      decoration:  InputDecoration(
                        hintText: "example@gmail.com",
                        hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Password",
                        style: textStyles.normalTextStyle.copyWith(color: Colors.white),
                    ),
                    TextField(
                      style: textStyles.normalTextStyle.copyWith(color: Colors.white),
                      decoration:  InputDecoration(
                        hintText: "*******",
                        hintStyle: textStyles.normalTextStyle.copyWith(color: Colors.grey),
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
                          builder: (context) => const DashBoard(),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style:  textStyles.normalTextStyleBold.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: textStyles.normalTextStyle.copyWith(color: Colors.white)
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                        text: "Register",
                        style: GoogleFonts.andika(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
