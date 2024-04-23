import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/OnboardingScreens/signIn.dart';
import 'package:sehyogini_frontned/Screens/Settings.dart';
import 'package:sehyogini_frontned/controllers/bottom_bar.dart';
import 'package:sehyogini_frontned/onboarding.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/localisation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bottomController navbarController = Get.put(bottomController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: AppBar(
                centerTitle: true,
                title: Text("MaitriMandram",
                    style: GoogleFonts.poppins(fontSize: 25)),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(SettingsScreen());
                      },
                      icon: Icon(Icons.notifications))
                ],
              ),
            ),
          ),
          body: Obx(() => pages[navbarController.currentindex.value]),
          bottomNavigationBar: Obx(() => CurvedNavigationBar(
                  index: navbarController.currentindex.value,
                  color: colors.pinkMain,
                  animationDuration: Duration(milliseconds: 250),
                  backgroundColor: Colors.white,
                  onTap: (value) => navbarController.setvalue(value),
                  buttonBackgroundColor: colors.pinkMain,
                  height: 60,
                  items: [
                    Image.asset(
                      "assets/community.png",
                      height: 30,
                      color: Colors.white,
                    ),
                    Image.asset(
                      "assets/voices.png",
                      height: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      color: Colors.white,
                      CupertinoIcons.briefcase_fill,
                      size: 30,
                    ),
                    Icon(
                      color: Colors.white,
                      Icons.shopping_cart,
                      size: 30,
                    ),
                    Icon(
                      color: Colors.white,
                      Icons.person_2_rounded,
                      size: 30,
                    ),
                  ]))),
    );
  }
}
