import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/OnboardingScreens/signIn.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
