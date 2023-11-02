import 'package:bank_app/Screens/Transfers/out_transfer.dart';
import 'package:bank_app/Screens/Transfers/transfer_page.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/navigator.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:bank_app/WIdgets/widgets.dart';
import 'package:bank_app/Screens/Home/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> dashBoardKey = GlobalKey();
  TextStyles textStyles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: dashBoardKey,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    InkWell(
                      child: const Icon(Icons.menu),
                      onTap: () {
                        dashBoardKey.currentState!.openDrawer();
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("images/pic.png"),
                          ),
                        ),
                      ),
                    ),
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
                      Colors.blue,
                      Color(0xffF58218),
                      Colors.blue,
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
                  style: GoogleFonts.poppins(
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
                children: [
                  QuickActionButton(
                    image: "images/arrow.png",
                    label: "Transfer",
                    onPressed: () {
                      showTransferDialog();
                    },
                  ),
                  const QuickActionButton(
                    label: "Withdraw",
                    image: "images/charge.png",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 43,
                child: const QuickActionButton(
                  label: "Make an Enquiry",
                  image: "",
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Latest Transactions",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff333A45),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                controller: ScrollController(),
                shrinkWrap: true,
                children: [
                  helpCard(
                    name: "Fixed Deposit",
                    subText: "Fixed Returns with Peace of Mind",
                  ),
                  helpCard(
                    name: "Current Account",
                    subText: "Banking Solutions for a Business",
                  ),
                  helpCard(
                    name: "Mutual Funds",
                    subText: "Our Strategies for Better Returns",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showTransferDialog() {
    showModalBottomSheet(
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Choose Destination",
                    style: TextStyles().appBarStyle,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(ctx);
                    },
                    child: popButton(Icons.close, ctx, Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: ListTile(
                  leading: const Icon(Icons.house),
                  title: Text(
                    "Transfer to OUR user",
                    style: textStyles.normalTextStyleBold,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: ListTile(
                  leading: const Icon(Icons.house),
                  title: Text(
                    "Transfer to other Banks",
                    style: textStyles.normalTextStyleBold,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    nextPage(
                      context,
                      const OutTransferPage(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

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
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Image.asset(
              "images/logo_drawer.png",
            ),
          ),
          const Divider(color: Colors.blue),
          const ListTile(
            title: Text(
              "Services",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          const Divider(color: Colors.blue),
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
          const Divider(color: Colors.blue),
          const ListTile(
            title: Text(
              "Get Intouch",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          const Divider(color: Colors.blue),
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
