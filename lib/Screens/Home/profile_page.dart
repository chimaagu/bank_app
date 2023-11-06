import 'package:bank_app/Screens/pin_settings_page.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyles tetStyle = TextStyles();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyles().appBarStyle.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xff171717),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Fernandes Peps",
                      style: GoogleFonts.andika(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xff171717),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: GoogleFonts.andika(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: tetStyle.normalTextStyleBold,
                        ),
                        Text(
                          "example@gmail.com",
                          style: tetStyle.normalTextStyle,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Phone Number",
                          style: tetStyle.normalTextStyleBold,
                        ),
                        Text(
                          "3493785745957",
                          style: tetStyle.normalTextStyle,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Country",
                          style: tetStyle.normalTextStyleBold,
                        ),
                        Text(
                          "Nairobi",
                          style: tetStyle.normalTextStyle,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "City",
                          style: tetStyle.normalTextStyleBold,
                        ),
                        Text(
                          "St. Georgia ",
                          style: tetStyle.normalTextStyle,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Security",
                          style: tetStyle.appBarStyle,
                        ),
                        const ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Change Password"),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text("Account Pin Settings"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                          onTap: () {
                            nextPage(context, const AccountSettings());
                          },
                        ),
                        const Divider(),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
