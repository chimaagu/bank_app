import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                const Stack(
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
                const SizedBox(height: 20),
                Text(
                  "Fernandes Peps",
                  style: GoogleFonts.andika(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Column(
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
                          hintText: "Josh",
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
                          hintText: "Sam",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff171717),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Save Changes",
                      style: GoogleFonts.andika(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
