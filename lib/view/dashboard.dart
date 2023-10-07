import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("images/pic.png"),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.menu),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Good morning, Max!",
                    style: GoogleFonts.andika(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff333A45),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 174,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff171717),
                        Color(0xffF58218),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Savings Account",
                            style: GoogleFonts.andika(
                              fontSize: 14,
                              // fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "452 050 791",
                            style: GoogleFonts.andika(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              r"$205,82",
                              style: GoogleFonts.andika(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Account balance",
                              style: GoogleFonts.andika(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const AnimatedAlign(
                        curve: Curves.ease,
                        alignment: Alignment.bottomRight,
                        duration: Duration(milliseconds: 500),
                        child: Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Quick actions",
                    style: GoogleFonts.andika(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff333A45),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GridView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 43,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 30,
                  ),
                  children: const [
                    QuickActionButton(
                      image: "images/arrow.png",
                      label: "Transfer",
                    ),
                    QuickActionButton(
                      label: "Payment",
                      image: "images/card.png",
                    ),
                    QuickActionButton(
                      label: "Top-up",
                      image: "images/charge.png",
                    ),
                    QuickActionButton(
                      label: "QR Pay",
                      image: "images/qrpay.png",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Latest Transactions",
                        style: GoogleFonts.andika(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff333A45),
                        ),
                      ),
                      const Spacer(),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  controller: ScrollController(),
                  shrinkWrap: true,
                  children: [
                    transactionCard(
                      name: "My Wife",
                      specialist: "Top-up",
                      image: "images/wife.png",
                    ),
                    transactionCard(
                      name: "Emmanuel Fernandes",
                      specialist: "Top-up",
                      image: "images/wife.png",
                    ),
                    transactionCard(
                      name: "Emma Jets",
                      specialist: "Payments",
                      image: "images/wife.png",
                    ),
                    transactionCard(
                      name: "My Wife",
                      specialist: "Top-up",
                      image: "images/wife.png",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget transactionCard({
    String? name,
    String? specialist,
    String? image,
    VoidCallback? onTap,
    BuildContext? ctx,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 10,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(image.toString()),
                child: image == null
                    ? const Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: GoogleFonts.andika(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  specialist!,
                  style: GoogleFonts.andika(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Transfer to other accounts",
                  style: GoogleFonts.andika(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              r"-20, 000$",
              style: GoogleFonts.andika(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final String label;
  final String image;
  const QuickActionButton({
    super.key,
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff282828),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(width: 15),
          Text(
            label,
            style: GoogleFonts.andika(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
