import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sehyogini_frontned/controllers/get_posts_controller.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakeAPostController extends GetxController {
  GetPostsController postsController = Get.put(GetPostsController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  RxBool isLoading = false.obs;
  RxBool isPosted = true.obs;
  TextEditingController contentcontroller = TextEditingController();
  @override
  onInit() {
    super.onInit();
    // doLike("");
  }

  Future<bool> createPost() async {
    isLoading(true);
    update();
    final SharedPreferences prefs = await _prefs;
    var name = await prefs.getString("name");
    var userID = await prefs.getString("token");
    try {
      Map body = {
        "title": "",
        "author": name,
        "authorID": userID,
        "content": contentcontroller.text,
        "comments": [],
        "likes": []
      };
      final response = await http.post(
        Uri.parse(URL.makeAPost),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("do Like called");
      // print(response.statusCode);

      if (response.statusCode == 200) {
        // print("aa gya respo");
        var data = await jsonDecode(response.body);

        isPosted.value = data['isposted'];
        print(isPosted.value);
        update();
        return true;
      } else {
        print(response);
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      print(e.toString());
      return false;
    } finally {
      isLoading(false);
      contentcontroller.clear();
      update();
    }
  }
}
