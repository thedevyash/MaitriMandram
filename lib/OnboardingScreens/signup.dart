// import 'dart:html';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/OnboardingScreens/eduDetiails.dart';
import 'package:sehyogini_frontned/OnboardingScreens/recruiterDetails.dart';
import 'package:sehyogini_frontned/controllers/signUp_controller.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/dropdown.dart';
import 'package:sehyogini_frontned/utils/login_field.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Register",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    fontSize: 34, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              LoginField(
                                  hint: "Enter Your Name",
                                  textEditingController:
                                      controller.usernameController,
                                  isfilled: user),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              SizedBox(
                                width: width * 0.85,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        minHeight: 50,
                                        maxHeight: 50,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffE0E0E0)),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(9),
                                          )),
                                      child: CountryCodePicker(
                                        padding: EdgeInsets.all(0),
                                        hideMainText: false,
                                        onInit: (value) {
                                          phonePref = value;
                                        },
                                        onChanged: (value) {
                                          phonePref = value;
                                        },
                                        showFlag: false,
                                        initialSelection: 'IN',
                                        favorite: ['+91', 'IN'],
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        alignLeft: false,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                      child: LoginField(
                                        type: TextInputType.phone,
                                        limit: 10,
                                        hint: "Enter phone number",
                                        textEditingController:
                                            controller.phoneController,
                                        isfilled: mob,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              LoginField(
                                  hint: "Enter Your Email",
                                  textEditingController:
                                      controller.emailController,
                                  isfilled: email),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              LoginField(
                                hint: "Enter your DOB",
                                textEditingController:
                                    controller.dateController,
                                any: _selectDate,
                                read: true,
                                isfilled: dob,
                              ),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              PasswordField(
                                hint: "Enter new password",
                                textEditingController:
                                    controller.passwordController,
                                fun: setReadPass,
                                read: readPass,
                                isfilled: pass,
                              ),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              PasswordField(
                                hint: "Enter same password",
                                textEditingController:
                                    controller.repasswordController,
                                fun: setReadRePass,
                                read: readRePass,
                                isfilled: repass,
                              ),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              DropDown(
                                list: gender,
                                hint: "Select your gender",
                                textEditingController:
                                    controller.genderController,
                                isfilled: gen,
                              ),
                              SizedBox(
                                height: height * 0.018,
                              ),
                              DropDown(
                                list: city,
                                hint: "Select your City",
                                textEditingController:
                                    controller.cityController,
                                isfilled: cityF,
                              ),
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
                                    controller.usernameController.text.isEmpty
                                        ? user = false
                                        : user = true;
                                    controller.emailController.text.isEmpty
                                        ? email = false
                                        : email = true;
                                    controller.passwordController.text.isEmpty
                                        ? pass = false
                                        : pass = true;
                                    controller.repasswordController.text.isEmpty
                                        ? repass = false
                                        : repass = true;
                                    controller.dateController.text.isEmpty
                                        ? dob = false
                                        : dob = true;
                                    controller.cityController.text.isEmpty
                                        ? cityF = false
                                        : cityF = true;
                                    controller.genderController.text.isEmpty
                                        ? gen = false
                                        : gen = true;
                                    controller.phoneController.text.isEmpty
                                        ? mob = false
                                        : mob = true;
                                    setState(() {});
                                    if (controller.passwordController.text !=
                                        controller.repasswordController.text) {
                                      Get.snackbar(
                                        'Password Mismatch',
                                        'Password and Re-enter password should be same',
                                        // backgroundColor: colors.kblack,
                                        // colorText: colors.kWhite,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    } else if (user &&
                                        email &&
                                        dob &&
                                        pass &&
                                        repass &&
                                        gen &&
                                        mob) {
                                      Get.to(() => controller.acctype == "user"
                                          ? EducDetailsScreen(
                                              phonePref: phonePref,
                                            )
                                          : RecruiterDetailsScreen(
                                              phonePref: phonePref,
                                            ));
                                      //   }
                                      // }
                                    } else {
                                      Get.snackbar("Fill All Fields",
                                          "Please fill all the fields",
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                  },
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Next",
                                          style: GoogleFonts.poppins(
                                              fontSize: 26,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded)
                                      ],
                                    ),
                                  ))
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
