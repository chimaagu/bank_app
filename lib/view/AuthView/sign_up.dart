import 'package:bank_app/view/AuthView/login_page.dart';
import 'package:bank_app/view/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: GoogleFonts.andika(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
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
                    "Password",
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
                      hintText: "*******",
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Confirm Password",
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
                      hintText: "*******",
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "First Name",
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
                      hintText: "josh",
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Last Name",
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
                      hintText: "Sammy",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff171717),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const DashBoard(),
                      ),
                    );
                  },
                  child: Text(
                    "Register",
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
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
