import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/Screens/pages/community.dart';
import 'package:sehyogini_frontned/Screens/pages/myprofile.dart';
import 'package:sehyogini_frontned/Screens/pages/opportunity.dart';
import 'package:sehyogini_frontned/Screens/pages/voices.dart';

class colors {
  static const purp = Color.fromRGBO(86, 3, 173, 1);
  static const purpAcc = Color.fromRGBO(131, 103, 199, 1);
  static const purpLight = Color.fromRGBO(221, 219, 241, 1);
  static const black = Color.fromRGBO(19, 4, 1, 1);
  static const pink = Color.fromRGBO(238, 66, 102, 1);
  static const pinkMain = Color(0xffFF566A);
  static const purpMain = Color(0xff8C5CB3);
  static const grey = Color.fromARGB(255, 241, 238, 238);
}

List<DropdownMenuEntry> gender = [
  DropdownMenuEntry(value: "Male", label: "Male"),
  DropdownMenuEntry(value: "Female", label: "Female"),
  DropdownMenuEntry(value: "Other", label: "Other"),
  DropdownMenuEntry(value: "Not to say", label: "Not To say"),
];

List<DropdownMenuEntry> city = [
  DropdownMenuEntry(value: "Delhi", label: "Delhi"),
  DropdownMenuEntry(value: "Chennai", label: "Chennai"),
  DropdownMenuEntry(value: "Mumbai", label: "Mumbai"),
  DropdownMenuEntry(value: "Lucknow", label: "Lucknow"),
  DropdownMenuEntry(value: "Hyderabad", label: "Hyderabad"),
];

List pages = [
  CommunityScreen(),
  VoicesScreen(),
  OpportunityScreen(),
  MyProfile()
];

var styleTitle = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600);

var styleContent = GoogleFonts.poppins(
  fontSize: 14,
);
