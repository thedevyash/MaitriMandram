import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController levelEdu = TextEditingController();
  TextEditingController employeStatusController = TextEditingController();
  TextEditingController lookingForController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController organisationIDcontroller = TextEditingController();
  var acctype = "user";
  bool isLoading = false;
  RxBool employStatus = false.obs;
  RxString phonePref = "+91".obs;
  Future<bool> signup(BuildContext context, var phonePref) async {
    isLoading = true;
    update();
    final SharedPreferences prefs = await _prefs;

    var url = Uri.parse(URL.signup);
    Map details = {
      "employementsStatus": employeStatusController.text,
      "lookingFor": lookingForController.text,
      "levelOfEducation": levelEdu.text,
      "companyName": companyNameController.text,
      "companyRole": roleController.text,
      "organisationID": organisationIDcontroller.text
    };
    Map body = {
      "name": usernameController.text,
      "phone": "$phonePref${phoneController.text}",
      "email": emailController.text,
      "dob": dateController.text,
      "password": passwordController.text,
      "gender": genderController.text,
      "city": cityController.text,
      "acctype": acctype,
      "state": "London",
      "profilePic": "samplePic",
      "details": details
    };
    print(body);
    var response;
    try {
      response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );
      if (response.statusCode == 200) {
        print(response.body);
        await prefs.setString("token", jsonDecode(response.body)['id']);
        await prefs.setBool("isLoggedIn", true);
        await prefs.setString("name", usernameController.text);
        if (acctype == "user")
          await prefs.setBool("isRecruiter", false);
        else
          await prefs.setBool("isRecruiter", true);

        roleController.clear();
        usernameController.clear();
        passwordController.clear();
        phoneController.clear();
        levelEdu.clear();
        repasswordController.clear();
        cityController.clear();
        dateController.clear();
        genderController.clear();
        emailController.clear();
        lookingForController.clear();
        employeStatusController.clear();
        companyNameController.clear();
        return true;
      } else {
        print(response);
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      print(e.toString());
      print(response.statusCode);
      print(response.body);
      // show error SnackBar

      Get.snackbar(
        'Registration Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: colors.pinkMain,
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      );
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }
}
