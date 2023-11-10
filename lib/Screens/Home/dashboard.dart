import 'package:bank_app/Provider/DatabaseProvider/db_provider.dart';
import 'package:bank_app/Screens/Deposit/deposit_transfer.dart';
import 'package:bank_app/Screens/Home/withdrawal.dart';
import 'package:bank_app/Screens/Transfers/out_transfer.dart';
import 'package:bank_app/Styles/colors.dart';
import 'package:bank_app/Styles/text_styles.dart';
import 'package:bank_app/Utils/navigator.dart';
import 'package:bank_app/Utils/pop_button.dart';
import 'package:bank_app/Utils/snackBar.dart';
import 'package:bank_app/WIdgets/drawer_widget.dart';
import 'package:bank_app/WIdgets/in_app_transfer_widget.dart';
import 'package:bank_app/WIdgets/widgets.dart';
import 'package:bank_app/Screens/Home/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> dashBoardKey = GlobalKey();
  TextStyles textStyles = TextStyles();

  var pin;
  final formatCurrency = NumberFormat.simpleCurrency();
  bool isObscure = true;

  @override
  void initState() {
    pin = DbProvider().getTransferPin();
    super.initState();
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 174,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryColor,
                      primaryColor,
                      primaryColor,
                      secondaryColor,
                      primaryColor,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedAlign(
                      curve: Curves.ease,
                      alignment: Alignment.topRight,
                      duration: const Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child:  Icon(
                          isObscure == true? Icons.visibility : Icons.visibility_off_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isObscure != true ? "----------" : formatCurrency.format(203577),
                            style: GoogleFonts.andika(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Account balance",
                            style: textStyles.normalTextStyle.copyWith(color: Colors.white)
                          ),
                        ],
                      ),
                    ),

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
                  crossAxisCount: 3,
                  mainAxisExtent: 100,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  QuickActionButton(
                    image: Icons.arrow_forward,
                    label: "Transfer",
                    onPressed: () {
                      if (pin == null) {
                        showSnackBar("Please set a transfer pin", context);
                      } else {
                        showTransferDialog();
                      }
                    },
                  ),
                  QuickActionButton(
                    label: "Withdraw",
                    image: Icons.arrow_downward_rounded,
                    onPressed: () {
                      nextPage(context, const WithdrawalPage());
                    },
                  ),
                  QuickActionButton(
                    label: "Deposit",
                    image: Icons.add,
                    onPressed: () {
                      // showDepositModal();
                      nextPage(
                        context,
                        const DepositByTransfer(),
                      );
                    },
                  ),
                ],
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
                  onTap: () {
                    Navigator.pop(ctx);
                    showModalBottomSheet(
                      isScrollControlled: true,
                      enableDrag: true,
                      context: context,
                      builder: (ctx) {
                        return InAppTransferWidget(
                          context: ctx,
                        );
                      },
                    );
                  },
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

  void showDepositModal() {
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
                    "Select Payment method",
                    style: TextStyles().appBarStyle,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(ctx);
                    },
                    child: popButton(Icons.close, ctx, Colors.black),
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
                    "Pay with Card",
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
                    "Pay with Transfer",
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
                      const DepositByTransfer(),
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


