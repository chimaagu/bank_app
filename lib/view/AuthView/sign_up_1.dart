import 'package:bank_app/view/AuthView/login_page.dart';
import 'package:bank_app/view/AuthView/sign_up_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/logo.png"),
                  Text(
                    "Register",
                    style: GoogleFonts.andika(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Kindly provide the information requested below to enable us create an account for you.",
                    style: GoogleFonts.andika(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.andika(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "example@gmail.com",
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Phone Number",
                        style: GoogleFonts.andika(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:
                            const InputDecoration(hintText: "phone number"),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Zip Code",
                        style: GoogleFonts.andika(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "zip code / postal code",
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Date of Birth",
                        style: GoogleFonts.andika(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Nigeria",
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "State",
                        style: GoogleFonts.andika(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Lagos",
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "City",
                        style: GoogleFonts.andika(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.andika(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Ikeja",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
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
                        style: GoogleFonts.andika(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
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
                            color: Colors.black,
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
