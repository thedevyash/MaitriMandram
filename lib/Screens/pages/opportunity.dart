import 'package:floating_tabbar/floating_tabbar.dart';
import 'package:floating_tabbar/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/Screens/opportunityPages/Schemes.dart';
import 'package:sehyogini_frontned/Screens/opportunityPages/opportunities.dart';
import 'package:sehyogini_frontned/Screens/opportunityPages/workshop.dart';

class OpportunityScreen extends StatefulWidget {
  const OpportunityScreen({super.key});

  @override
  State<OpportunityScreen> createState() => _OpportunityScreenState();
}

class _OpportunityScreenState extends State<OpportunityScreen> {
  CustomTabBarController controller = CustomTabBarController();
  List tabs = ["Schemes", "Workshops"];
  late PageController _controller = PageController(initialPage: 0);
  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
        transform: ColorsTransform(
            highlightColor: Colors.white,
            normalColor: Colors.black,
            builder: (context, color) {
              return Container(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                alignment: Alignment.center,
                constraints: BoxConstraints(minWidth: 60),
                child: (Text(
                  tabs[index],
                  style: GoogleFonts.poppins(fontSize: 16, color: color),
                )),
              );
            }),
        index: index);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          CustomTabBar(
            width: 200,
            tabBarController: controller,
            height: 50,
            itemCount: 2,
            builder: getTabbarChild,
            indicator: RoundIndicator(
              color: Color(0xff1C53A3),
              top: 8,
              bottom: 8,
              left: 1,
              right: 1,
              radius: BorderRadius.circular(20),
            ),
            pageController: _controller,
          ),
          Expanded(
              child: PageView(
            children: [Schemes(), WorkshopScreen()],
            controller: _controller,
          ))
        ],
      ),
    );
  }
}
