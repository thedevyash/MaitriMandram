import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/controllers/getSchemes.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Schemes extends StatefulWidget {
  const Schemes({super.key});

  @override
  State<Schemes> createState() => _SchemesState();
}

class _SchemesState extends State<Schemes> {
  GetSchemeController controller = Get.put(GetSchemeController());

  _launchURL(String x) async {
    final Uri url = Uri.parse(x);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  _launchURLPhone(String x) async {
    if (await canLaunch(x)) {
      await launch(x);
    } else {
      throw 'Could not launch $x';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.myscheme.length,
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
                        borderRadius: BorderRadius.all(Radius.circular(16))),
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
                                  controller.myscheme[index].ministryName!,
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
                          Image.network(
                            controller.myscheme[index].icon!,
                            height: 100,
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
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 6),
                                child: Text(
                                  controller.myscheme[index].benefits
                                      .toString(),
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: colors.grey),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller
                                        .myscheme[index].schemeDescription!,
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 8,
                                              right: 8),
                                          fixedSize: Size(100, 24),
                                          backgroundColor: Colors.red),
                                      onPressed: () => _launchURL(
                                          controller.myscheme[index].url!),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Read More",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 14,
                                          )
                                        ],
                                      )),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 8,
                                              right: 8),
                                          fixedSize: Size(100, 24),
                                          backgroundColor: Colors.red),
                                      onPressed: () => _launchURLPhone(
                                          "tel:${controller.myscheme[index].helpline!}"),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "HelpLine",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.call,
                                            color: Colors.white,
                                            size: 14,
                                          )
                                        ],
                                      )),
                                ],
                              ),
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
    );
  }
}
