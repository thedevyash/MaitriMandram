import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/controllers/getUserById.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GetUserByIdController userByIdController = Get.put(GetUserByIdController());
  bool isLoading = false;
  Future<bool> login(BuildContext context, var phonePref) async {
    isLoading = true;
    update();
    final SharedPreferences prefs = await _prefs;
    var url = Uri.parse(URL.login);
    Map body = {
      "phone": "$phonePref${phonecontroller.text}",
      "password": passwordcontroller.text
    };
    // print(url);
    print(body);
    var response;
    try {
      response = await http.post(url, body: jsonEncode(body), headers: {
        // "Content-Type": "application/json",
        // "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      });
      print("connect");
      if (response.statusCode == 200) {
        print(response.body);
        await prefs.setString("token", jsonDecode(response.body)['id']);
        await prefs.setBool("isLoggedIn", true);
        await userByIdController.getUserById(jsonDecode(response.body)['id']);
        await prefs.setString("name", userByIdController.myUser.value.name!);
        phonecontroller.clear();
        passwordcontroller.clear();
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
        'Login Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: colors.pink,
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      );

      return false;
    } finally {
      isLoading = false;
      update();
    }
  }
}
