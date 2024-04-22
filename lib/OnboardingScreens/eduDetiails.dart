import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/Screens/homeScreen.dart';
import 'package:sehyogini_frontned/controllers/signUp_controller.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/dropdown.dart';
import 'package:sehyogini_frontned/utils/login_field.dart';
import 'package:intl/intl.dart';

class EducDetailsScreen extends StatefulWidget {
  var phonePref;
  EducDetailsScreen({super.key, required this.phonePref});

  @override
  State<EducDetailsScreen> createState() => _EducDetailsScreenState();
}

class _EducDetailsScreenState extends State<EducDetailsScreen> {
  RegisterController controller = Get.put(RegisterController());
  List<DropdownMenuEntry> employementStatus = [
    DropdownMenuEntry(value: "Yes", label: "Yes"),
    DropdownMenuEntry(value: "No", label: "No"),
  ];
  List<DropdownMenuEntry> lookingfor = [
    DropdownMenuEntry(value: "mentorship", label: "Mentorship"),
    DropdownMenuEntry(value: "parenting", label: "Parenting"),
    DropdownMenuEntry(value: "financial literacy", label: "Financial Literacy"),
    DropdownMenuEntry(value: "career development", label: "Career Development"),
    DropdownMenuEntry(value: "financial literacy", label: "Financial Literacy"),
  ];
  bool levEdu = true;
  bool lookFor = true;
  bool employe = true;
  bool user = true;
  bool email = true;
  bool pass = true;
  bool repass = true;
  bool dob = true;
  bool cityF = true;
  bool gen = true;
  var status = "No";

  void statusChange(var statusNew) {
    setState(() {
      status = statusNew;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  height: height * 0.85,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "More Details",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    fontSize: 34, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              LoginField(
                                  hint: "Highest level of education completed",
                                  textEditingController: controller.levelEdu,
                                  isfilled: user),
                              SizedBox(
                                height: height * 0.018,
                              ),

                              //upload the
                              DropDown(
                                list: lookingfor,
                                hint: "What are you looking for?",
                                textEditingController:
                                    controller.lookingForController,
                                isfilled: cityF,
                              ),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                    maxHeight: 50, minHeight: 40),
                                child: Center(
                                  child: DropdownMenu(
                                    onSelected: (value) {
                                      setState(() {
                                        if (value == "Yes")
                                          controller.employStatus.value = true;
                                        else
                                          controller.employStatus.value = false;
                                      });
                                    },
                                    // enableFilter: true

                                    menuStyle: MenuStyle(
                                      shape: MaterialStatePropertyAll(
                                          BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      backgroundColor:
                                          const MaterialStatePropertyAll<Color>(
                                              Colors.white),
                                    ),
                                    inputDecorationTheme: InputDecorationTheme(
                                      labelStyle: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: colors.pinkMain),
                                      floatingLabelStyle: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: colors.pinkMain),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      alignLabelWithHint: true,
                                      contentPadding: const EdgeInsets.all(8),
                                      activeIndicatorBorder: BorderSide.none,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(9)),
                                          borderSide: BorderSide(
                                              color: const Color(0xffE0E0E0))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(9)),
                                          borderSide: BorderSide(
                                              color: const Color(0xffE0E0E0))),
                                      // isDense: true,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xffE0E0E0)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xffE0E0E0))),
                                    ),
                                    controller:
                                        controller.employeStatusController,
                                    expandedInsets: EdgeInsets.zero,
                                    dropdownMenuEntries: employementStatus,
                                    hintText: "Are You Employed Currently?",
                                    textStyle: GoogleFonts.poppins(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              Obx(() {
                                if (controller.employStatus.value) {
                                  return Column(children: [
                                    LoginField(
                                        hint: "Enter Your Company's Name",
                                        textEditingController:
                                            controller.companyNameController,
                                        isfilled: user),
                                    SizedBox(
                                      height: height * 0.018,
                                    ),
                                    LoginField(
                                        hint: "Your Role In The Company",
                                        textEditingController:
                                            controller.roleController,
                                        isfilled: user),
                                  ]);
                                } else
                                  return SizedBox();
                              }),

                              SizedBox(
                                height: height * 0.05,
                              ),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(width * 0.8, 60),
                                    maximumSize: Size(width * 0.8, 60),
                                    foregroundColor: colors.purpLight,
                                    side: BorderSide(color: colors.pinkMain),
                                    backgroundColor: colors.pinkMain,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    setState(() {});
                                    var res = await controller.signup(
                                        context, widget.phonePref);
                                    if (res) {
                                      Get.to(HomeScreen());
                                    } else {
                                      setState(() {});
                                    }
                                  },
                                  child: Center(
                                    child: controller.isLoading
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Register",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 26,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Icon(Icons
                                                  .arrow_forward_ios_rounded)
                                            ],
                                          ),
                                  )),
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
