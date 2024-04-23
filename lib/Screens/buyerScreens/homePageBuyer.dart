import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sehyogini_frontned/Screens/Marketplace/market.dart';
import 'package:sehyogini_frontned/Screens/Settings.dart';

class HomePageBuyer extends StatefulWidget {
  const HomePageBuyer({super.key});

  @override
  State<HomePageBuyer> createState() => _HomePageBuyerState();
}

class _HomePageBuyerState extends State<HomePageBuyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MaitriMandram"),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(SettingsScreen());
              },
              icon: Icon(Icons.notifications),
            )
          ],
        ),
        body: MarketPlace());
  }
}
