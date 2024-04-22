import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/controllers/bottom_bar.dart';
import 'package:sehyogini_frontned/controllers/getJobs.dart';
import 'package:sehyogini_frontned/controllers/getSchemes.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class oppoScreen extends StatefulWidget {
  const oppoScreen({super.key});

  @override
  State<oppoScreen> createState() => _oppoState();
}

class _oppoState extends State<oppoScreen> {
  GetJobsController controller = Get.put(GetJobsController());
  tabsController dropcontroller = Get.put(tabsController());

  _launchURL(String x) async {
    final Uri url = Uri.parse(x);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    dropcontroller;
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    // dropcontroller.dispose();
    // dropcontroller.currentindex.value = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomDropdown(
            itemsListPadding: EdgeInsets.all(12),
            listItemPadding: EdgeInsets.all(12),
            maxlines: 20,
            overlayHeight: 290,
            decoration: CustomDropdownDecoration(
              headerStyle: GoogleFonts.poppins(),
              hintStyle: GoogleFonts.poppins(color: Colors.grey),
              listItemStyle: GoogleFonts.poppins(),
              closedShadow: [
                const BoxShadow(
                  offset: Offset(0, 4),
                  color: Colors.grey,
                  blurRadius: 8,
                ),
              ],
            ),
            hintText: 'Select job category',
            items: [
              "Technology",
              "Freelance",
              "Craftsmanship",
              "Philanthropy",
              "Caregiving"
            ],
            onChanged: (value) {
              dropcontroller.currentindex.value = value;
              setState(() {});
            },
          ),
        ),
        dropcontroller.currentindex.value != ""
            ? Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (dropcontroller.currentindex.value == "Technology") {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myModelTech.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.work),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller
                                                .myModelTech[index].jobtitle!,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    // Image.network(
                                    //   controller.myModelCare[index].icon!,
                                    //   height: 100,
                                    // ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .myModelTech[index].company!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 6),
                                          child: Text(
                                            controller
                                                .myModelTech[index].description
                                                .toString(),
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(8)),
                                        //       color: colors.grey),
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(8.0),
                                        //     child: Text(
                                        //       controller
                                        //           .myModelTech[index].!,
                                        //       style: GoogleFonts.poppins(),
                                        //     ),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.only(
                                                    top: 4,
                                                    bottom: 4,
                                                    left: 8,
                                                    right: 8),
                                                fixedSize: Size(100, 24),
                                                backgroundColor: Colors.red),
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Read More",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (dropcontroller.currentindex.value == "Freelance") {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myModelFree.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/emblem.png'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller
                                              .myModelFree[index].jobtitle!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  // Image.network(
                                  //   controller.myModelCare[index].icon!,
                                  //   height: 100,
                                  // ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.myModelFree[index].company!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 6),
                                        child: Text(
                                          controller
                                              .myModelFree[index].description
                                              .toString(),
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(8)),
                                      //       color: colors.grey),
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: Text(
                                      //       controller
                                      //           .myModelTech[index].!,
                                      //       style: GoogleFonts.poppins(),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                  left: 8,
                                                  right: 8),
                                              fixedSize: Size(100, 24),
                                              backgroundColor: Colors.red),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Apply Now !",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (dropcontroller.currentindex.value ==
                      "Craftsmanship") {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myModelCraft.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/emblem.png'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller
                                              .myModelCraft[index].jobtitle!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  // Image.network(
                                  //   controller.myModelCare[index].icon!,
                                  //   height: 100,
                                  // ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.myModelCraft[index].company!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 6),
                                        child: Text(
                                          controller
                                              .myModelCraft[index].description
                                              .toString(),
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(8)),
                                      //       color: colors.grey),
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: Text(
                                      //       controller
                                      //           .myModelTech[index].!,
                                      //       style: GoogleFonts.poppins(),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                  left: 8,
                                                  right: 8),
                                              fixedSize: Size(100, 24),
                                              backgroundColor: Colors.red),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Apply Now !",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (dropcontroller.currentindex.value ==
                      "Philanthropy") {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myModelPhil.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/emblem.png'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller
                                              .myModelPhil[index].jobtitle!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  // Image.network(
                                  //   controller.myModelCare[index].icon!,
                                  //   height: 100,
                                  // ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.myModelPhil[index].company!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 6),
                                        child: Text(
                                          controller
                                              .myModelPhil[index].description
                                              .toString(),
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(8)),
                                      //       color: colors.grey),
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: Text(
                                      //       controller
                                      //           .myModelTech[index].!,
                                      //       style: GoogleFonts.poppins(),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                  left: 8,
                                                  right: 8),
                                              fixedSize: Size(100, 24),
                                              backgroundColor: Colors.red),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Apply Now !",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myModelCare.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/emblem.png'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller
                                              .myModelCare[index].jobtitle!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  // Image.network(
                                  //   controller.myModelCare[index].icon!,
                                  //   height: 100,
                                  // ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.myModelCare[index].company!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 6),
                                        child: Text(
                                          controller
                                              .myModelCare[index].description
                                              .toString(),
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(8)),
                                      //       color: colors.grey),
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: Text(
                                      //       controller
                                      //           .myModelTech[index].!,
                                      //       style: GoogleFonts.poppins(),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                  left: 8,
                                                  right: 8),
                                              fixedSize: Size(100, 24),
                                              backgroundColor: Colors.red),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Apply Now !",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

//iske andar
                }
              })
            : Obx(
                () => Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.myModelTech.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/emblem.png'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.myModelTech[index].jobtitle!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              // Image.network(
                              //   controller.myModelCare[index].icon!,
                              //   height: 100,
                              // ),
                              SizedBox(
                                height: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.myModelTech[index].company!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 6),
                                    child: Text(
                                      controller.myModelTech[index].description
                                          .toString(),
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.all(
                                  //           Radius.circular(8)),
                                  //       color: colors.grey),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Text(
                                  //       controller
                                  //           .myModelTech[index].!,
                                  //       style: GoogleFonts.poppins(),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 8,
                                              right: 8),
                                          fixedSize: Size(100, 24),
                                          backgroundColor: Colors.red),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Apply Now !",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
        // Obx(() {
        //   if (dropcontroller.currentindex.value == "") {
        //     return Center(
        //       child: Text("Please Select A Category"),
        //     );
        //   } else

        // else {
        //     return SizedBox();
        //   }
        // })
      ],
    ));
  }
}
