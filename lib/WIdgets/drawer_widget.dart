import 'package:bank_app/Styles/colors.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(

      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      width: 250,
      child: ListView(
        children: [
          DrawerHeader(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 500),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset(
              "images/logo.png",
            ),
          ),

          const ListTile(
            title: Text(
              "Services",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          const Divider(color: secondaryColor),
          const ListTile(
            title: Text(
              "Apply now",
              style: TextStyle(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          const Divider(color: secondaryColor),
          const ListTile(
            title: Text(
              "Get Intouch",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          const Divider(color: secondaryColor),
          const ListTile(
            title: Text(
              "Log Out",
            ),
            trailing: Icon(
              Icons.logout_rounded,
              color: Colors.red,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}