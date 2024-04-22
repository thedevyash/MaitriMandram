import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/controllers/getSchemes.dart';
import 'package:sehyogini_frontned/controllers/workshop_controller.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkshopScreen extends StatefulWidget {
  const WorkshopScreen({super.key});

  @override
  State<WorkshopScreen> createState() => _WorkshopScreenState();
}

class _WorkshopScreenState extends State<WorkshopScreen> {
  GetWorkshopController controller = Get.put(GetWorkshopController());
  _launchURL(String x) async {
    final Uri url = Uri.parse(x);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Workshops in",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Colors.black),
              children: [
                TextSpan(
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    text: " Chennai")
              ])
        ])),
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.myworkshop.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        constraints: BoxConstraints(minHeight: 500),
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
                                  Image.asset(
                                    'assets/empower.png',
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller
                                          .myworkshop[index].workshopName!,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    height: 150, "assets/image.png"),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Benefits",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 6),
                                    child: Text(
                                      controller.myworkshop[index].workshopName
                                          .toString(),
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: colors.grey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.myworkshop[index]
                                            .workshopDescription!,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                  ),
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
                                      onPressed: () => _launchURL(controller
                                          .myworkshop[index].location!),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Location",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 14,
                                          )
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
                );
              }
            },
          ),
        )
      ]),
    );
  }
}
