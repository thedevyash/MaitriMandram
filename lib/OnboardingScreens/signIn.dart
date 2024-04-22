import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/OnboardingScreens/accountType.dart';
import 'package:sehyogini_frontned/OnboardingScreens/signup.dart';
import 'package:sehyogini_frontned/Screens/homeScreen.dart';
import 'package:sehyogini_frontned/controllers/login_controller.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/login_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LoginController controller = Get.put(LoginController());
  bool mob = true;
  bool pass = true;
  var phonePref;
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
          Positioned(
              top: height * 0.262,
              left: 20,
              child: Image.asset("assets/images/sehyogini.png",
                  height: height * 0.07)),
          Positioned(
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * 0.39,
                  width: width,
                  constraints: BoxConstraints(maxWidth: width, minHeight: 330),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14.0, left: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Sign In",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 34, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            // LoginField(
                            //   hint: "Enter Mobile Number",
                            //   textEditingController: controller.phonecontroller,
                            //   isfilled: mob,
                            //   limit: 10,
                            // ),
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
                                          controller.phonecontroller,
                                      isfilled: mob,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.018,
                            ),
                            PasswordField(
                                hint: "Enter Password",
                                textEditingController:
                                    controller.passwordcontroller,
                                isfilled: pass),
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
                                  controller.phonecontroller.text.isEmpty
                                      ? mob = false
                                      : mob = true;
                                  controller.passwordcontroller.text.isEmpty
                                      ? pass = false
                                      : pass = true;

                                  if (mob && pass) {
                                    var res =
                                        controller.login(context, phonePref);
                                    if (await res) {
                                      Get.to(HomeScreen());
                                    }
                                  } else {
                                    Get.snackbar("Missing Details !",
                                        "Please Fill All Fields!",
                                        margin: EdgeInsets.only(
                                            bottom: 20, left: 10, right: 10),
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                  setState(() {});
                                },
                                child: controller.isLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Login",
                                        style: GoogleFonts.poppins(
                                            fontSize: 26,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      )),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: width * 0.7),
                            child: width >= 333
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Don't Have An Account ?",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      AccountType()));
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: colors.pinkMain),
                                        ),
                                      )
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Text(
                                        "Don't Have An Account ?",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      AccountType()));
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: colors.pinkMain),
                                        ),
                                      )
                                    ],
                                  )),
                      ],
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
