// import 'package:countup/countup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sehyogini_frontned/Screens/Settings.dart';
// import 'package:sehyogini_frontned/Screens/pages/myposts.dart';
// import 'package:sehyogini_frontned/Screens/pages/rewardsHistory.dart';
// import 'package:sehyogini_frontned/controllers/getUserById.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});

//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }

// class _MyProfileState extends State<MyProfile> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   GetUserByIdController controller = Get.put(GetUserByIdController());
//   var user;
//   void gettingDetails() async {
//     final SharedPreferences prefs = await _prefs;
//     var token = prefs.getString("token");
//     controller.getUserById(token.toString());
//     setState(() {});
//   }

//   @override
//   void initState() {
//     gettingDetails();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           return Padding(
//             padding: const EdgeInsets.only(right: 20.0, left: 20, top: 14),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Your Profile",
//                   style: GoogleFonts.poppins(fontSize: 24),
//                 ),
//                 Container(
//                   width: width * 0.92,
//                   padding: EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         child: Icon(
//                           Icons.person,
//                           size: 20,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             controller.myUser.value.name!,
//                             style: GoogleFonts.poppins(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 24),
//                           ),
//                           SizedBox(height: 10),
//                           GestureDetector(
//                             onTap: () {
//                               Get.to(RewardsHistoryScreen());
//                             },
//                             child: Container(
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.5),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     "assets/coins.png",
//                                     height: 30,
//                                   ),
//                                   Countup(
//                                     begin: 50,
//                                     end: 100,
//                                     duration: Duration(milliseconds: 500),
//                                     separator: ',',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 26,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 14,
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Divider(),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // Handle "My Orders" button press
//                   },
//                   child: Text(
//                     'My Orders',
//                     style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Get.to(MyPosts(controller: controller));
//                   },
//                   child: Text(
//                     'My Posts',
//                     style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // Handle "My Orders" button press
//                     Get.to(SettingsScreen());
//                   },
//                   child: Text(
//                     'Settings',
//                     style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/Screens/SellerScreens/becomeSeller.dart';
import 'package:sehyogini_frontned/Screens/Settings.dart';
import 'package:sehyogini_frontned/Screens/pages/myposts.dart';
import 'package:sehyogini_frontned/Screens/pages/rewardsHistory.dart';
import 'package:sehyogini_frontned/controllers/getUserById.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  GetUserByIdController controller = Get.put(GetUserByIdController());
  var user;
  void gettingDetails() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString("token");
    controller.getUserById(token.toString());
    setState(() {});
  }

  @override
  void initState() {
    gettingDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Profile",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  width: width * 0.92,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.myUser.value.name!,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Get.to(RewardsHistoryScreen());
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/coins.png",
                                    height: 30,
                                  ),
                                  Countup(
                                    begin: 50,
                                    end: 100,
                                    duration: Duration(milliseconds: 500),
                                    separator: ',',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Handle "My Orders" button press
                  },
                  child: Text(
                    'My Orders',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    Get.to(MyPosts(controller: controller));
                  },
                  child: Text(
                    'My Posts',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    // Handle "My Orders" button press
                    Get.to(BecomeASeller());
                  },
                  child: Text(
                    'Become A Seller',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    // Handle "My Orders" button press
                    Get.to(SettingsScreen());
                  },
                  child: Text(
                    'Settings',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
