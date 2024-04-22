import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person_2_rounded),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          controller.myUser.value.followTo!.length.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Following",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                            controller.myUser.value.followBy!.length.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 24)),
                        Text(
                          "Followers",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(controller.myUser.value.myposts!.length.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 24)),
                        Text(
                          "Posts",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  controller.myUser.value.name!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 14),
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "My Posts",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 24),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.myUser.value.myposts!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(Icons.person_2_rounded),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller.myUser.value.name!,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                controller.myUser.value.myposts![index]
                                    ["content"],
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        controller.myUser.value
                                            .myposts![index]["likes"].length
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "Likes",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet<dynamic>(
                                        backgroundColor: Colors.white,
                                        useSafeArea: true,
                                        isScrollControlled: true,
                                        showDragHandle: true,
                                        context: context,
                                        builder: (context) {
                                          return controller
                                                      .myUser
                                                      .value
                                                      .myposts![index]
                                                          ["comments"]
                                                      .length !=
                                                  0
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: controller
                                                      .myUser
                                                      .value
                                                      .myposts![index]
                                                          ["comments"]
                                                      .length,
                                                  itemBuilder:
                                                      (context, indexC) {
                                                    return ListTile(
                                                      leading:
                                                          const CircleAvatar(
                                                        child:
                                                            Icon(Icons.person),
                                                      ),
                                                      title: Text(controller
                                                                  .myUser
                                                                  .value
                                                                  .myposts![
                                                              index]["comments"]
                                                          [indexC]["name"]),
                                                      subtitle: Text(controller
                                                                  .myUser
                                                                  .value
                                                                  .myposts![
                                                              index]["comments"]
                                                          [indexC]["comment"]),
                                                    );
                                                  },
                                                )
                                              : Center(
                                                  child: Text(
                                                    "No Comments",
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          controller
                                              .myUser
                                              .value
                                              .myposts![index]["comments"]
                                              .length
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Comments",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
