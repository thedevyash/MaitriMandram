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

class RecruiterDetailsScreen extends StatefulWidget {
  var phonePref;
  RecruiterDetailsScreen({super.key, required this.phonePref});

  @override
  State<RecruiterDetailsScreen> createState() => _RecruiterDetailsScreenState();
}

class _RecruiterDetailsScreenState extends State<RecruiterDetailsScreen> {
  RegisterController controller = Get.put(RegisterController());
  bool mob = true;
  bool readPass = true;
  bool readRePass = false;
  bool user = true;
  bool email = true;
  bool pass = true;
  bool repass = true;
  bool dob = true;
  bool cityF = true;
  bool gen = true;
  var phonePref;

  String formatDate(DateTime _picked) {
    var formatter = new DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(_picked);
    return formatted.toString().split(" ")[0].replaceAll("-", "/");
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        barrierDismissible: true,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime(2100),
        locale: Locale('en'));

    if (_picked != null) {
      setState(() {
        controller.dateController.text = formatDate(_picked);
        dob = true;
      });
    }
  }

  void setReadPass() {
    setState(() {
      if (readPass == true)
        readPass = false;
      else
        readPass = true;
    });
  }

  void setReadRePass() {
    setState(() {
      if (readRePass == true)
        readRePass = false;
      else
        readRePass = true;
    });
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
                                  hint: "Enter Your Address",
                                  textEditingController:
                                      controller.companyNameController,
                                  isfilled: user),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              LoginField(
                                  hint: "Enter Your Pincode",
                                  textEditingController:
                                      controller.organisationIDcontroller,
                                  isfilled: user),
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
