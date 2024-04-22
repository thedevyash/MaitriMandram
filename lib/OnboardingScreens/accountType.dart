import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/OnboardingScreens/signup.dart';
import 'package:sehyogini_frontned/controllers/signUp_controller.dart';
import 'package:sehyogini_frontned/utils/constants.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.pinkMain,
        body: Stack(fit: StackFit.expand, children: [
          Positioned(
            left: 0,
            top: height * 0.032,
            child: SvgPicture.asset(
              height: height * 0.15,
              "assets/leftCloud.svg",
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 0,
            top: height * 0.311,
            child: SvgPicture.asset(
              "assets/rightCloud.svg",
              color: Colors.white,
              height: height * 0.20,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.75,
                  width: width * 0.9,
                  constraints: BoxConstraints(maxWidth: width, minHeight: 330),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 14.0, left: 18, right: 18),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Select Your Account Type",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    fontSize: 34, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(width * 0.465, 150),
                                  maximumSize: Size(width * 0.465, 150),
                                  foregroundColor: colors.purpLight,
                                  side: BorderSide(color: colors.pinkMain),
                                  backgroundColor: colors.pinkMain,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  controller.acctype = "recruiter";
                                  Get.to(SignupScreen());
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/ngo.png",
                                        height: 80,
                                      ),
                                      Text("Recruiter",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(width * 0.465, 150),
                                  maximumSize: Size(width * 0.465, 150),
                                  foregroundColor: colors.pinkMain,
                                  side: BorderSide(color: colors.pinkMain),
                                  backgroundColor: colors.pinkMain,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  controller.acctype = "user";
                                  Get.to(SignupScreen());
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/single.png",
                                        height: 80,
                                      ),
                                      Text("Single Mother",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ),
                              ),

                              // OutlinedButton(
                              //     style: OutlinedButton.styleFrom(
                              //       minimumSize: Size(width * 0.8, 60),
                              //       maximumSize: Size(width * 0.8, 60),
                              //       foregroundColor: colors.purpLight,
                              //       side: BorderSide(color: colors.purp),
                              //       backgroundColor: colors.purp,
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(30.0),
                              //       ),
                              //     ),
                              //     onPressed: () {},
                              //     child: Center(
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [
                              //           Text(
                              //             "Next",
                              //             style: GoogleFonts.poppins(
                              //                 fontSize: 26,
                              //                 color: Colors.white,
                              //                 fontWeight: FontWeight.w300),
                              //           ),
                              //           Icon(Icons.arrow_forward_ios_rounded)
                              //         ],
                              //       ),
                              //     )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
