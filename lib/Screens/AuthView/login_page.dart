import 'package:bank_app/Provider/auth_provider.dart';
import 'package:bank_app/Screens/AuthView/sign_up_1.dart';
import 'package:bank_app/Screens/AuthView/sign_up_2.dart';
import 'package:bank_app/Screens/Home/dashboard.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    bool name = sf.containsKey("email");
    print(name);
  }

  TextStyles textStyles = TextStyles();
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
                // Image.asset("images/logo.png"),
                Text("Welcome back 👏",
                    style: textStyles.appBarStyle
                        .copyWith(fontSize: 50, color: Colors.white)),
                const SizedBox(height: 15),
                Text(
                  "Login",
                  style: textStyles.appBarStyle.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: textStyles.normalTextStyle
                          .copyWith(color: Colors.white),
                    ),
                    TextField(
                      style: textStyles.normalTextStyle
                          .copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        hintStyle: textStyles.normalTextStyle
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Password",
                      style: textStyles.normalTextStyle
                          .copyWith(color: Colors.white),
                    ),
                    TextField(
                      style: textStyles.normalTextStyle
                          .copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "*******",
                        hintStyle: textStyles.normalTextStyle
                            .copyWith(color: Colors.grey),
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
                          backgroundColor: secondaryColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const DashBoard(),
                          ),
                        );
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
                              "Login",
                              style: textStyles.normalTextStyleBold.copyWith(
                                color: Colors.black,
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
                          text: "Don't have an account? ",
                          style: textStyles.normalTextStyle
                              .copyWith(color: Colors.white)),
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
                          color: secondaryColor,
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
