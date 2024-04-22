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

  _launchURL() async {
    final Uri url = Uri.parse('https://github.com/thedevyash');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 300, maxHeight: 300),
                    decoration: BoxDecoration(
                        color: colors.purp,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(20, 20),
                            bottomRight: Radius.circular(30))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Version 1.0",
                            style: GoogleFonts.poppins(fontSize: 23)),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: _launchURL,
                          child: Text("Github",
                              style: GoogleFonts.poppins(
                                  fontSize: 23, color: colors.purp)),
                        ),
                        TextButton(
                            onPressed: () async {
                              final SharedPreferences prefs = await _prefs;
                              prefs.setBool("isLoggedIn", false);
                              prefs.setString("token", "");
                              prefs.setString("name", "");
                              prefs.setBool("isRecruiter", false);
                              Get.offAll(SignInScreen());
                            },
                            child: Text("Log Out")),
                        Obx(
                          () => DropdownButton<String>(
                            value: localeController.locale.value,
                            items: [
                              DropdownMenuItem(
                                  child: Text("English"), value: "en"),
                              DropdownMenuItem(
                                  child: Text("Tamil"), value: "ta")
                            ],
                            onChanged: (String? newValue) {
                              localeController.changeLocale(newValue!);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          appBar: AppBar(
            centerTitle: true,
            title:
                Text("MaitriMandram", style: GoogleFonts.poppins(fontSize: 25)),
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(SettingsScreen());
                  },
                  icon: Icon(Icons.settings))
            ],
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
                      Icons.person_2_rounded,
                      size: 30,
                    ),
                  ]))),
    );
  }
}
