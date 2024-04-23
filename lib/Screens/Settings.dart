import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/OnboardingScreens/signIn.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/localisation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  _launchURL() async {
    final Uri url = Uri.parse('https://github.com/thedevyash');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  final LocaleController localeController = Get.put(LocaleController());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            title: Text(
              "Settings",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w500),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Version 1.0", style: GoogleFonts.poppins(fontSize: 23)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Mode",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      activeColor: colors.pinkMain,
                      inactiveTrackColor: Colors.grey[300],
                      inactiveThumbColor: Colors.grey[400],
                      value: select,
                      onChanged: (value) {
                        select = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: localeController.locale.value,
                      items: [
                        DropdownMenuItem(child: Text("English"), value: "en"),
                        DropdownMenuItem(child: Text("Tamil"), value: "ta")
                      ],
                      onChanged: (String? newValue) {
                        localeController.changeLocale(newValue!);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: Text("Github",
                      style: GoogleFonts.poppins(
                          fontSize: 23, color: colors.purp)),
                ),
                SizedBox(
                  height: 24,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: Size(130, 50),
                        backgroundColor: Color(0xff1C53A3),
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      prefs.setBool("isLoggedIn", false);
                      prefs.setString("token", "");
                      prefs.setString("name", "");
                      prefs.setBool("isRecruiter", false);
                      Get.offAll(SignInScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Logout",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(Icons.logout)
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
