import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sehyogini_frontned/controllers/get_posts_controller.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakeLikeCommentController extends GetxController {
  GetPostsController postsController = Get.put(GetPostsController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  RxBool isLoading = false.obs;
  RxBool isPosted = true.obs;
  TextEditingController commentcontroller = TextEditingController();
  @override
  onInit() {
    super.onInit();
    // doLike("");
  }

  Future<bool> doLike(String postId) async {
    isLoading(true);
    update();
    final SharedPreferences prefs = await _prefs;
    var userID = await prefs.getString("token");
    try {
      Map body = {"post": postId, "name": userID};
      final response = await http.post(
        Uri.parse(URL.doLike),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("do Like called");
      // print(response.statusCode);

      if (response.statusCode == 200) {
        // print("aa gya respo");

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
      update();
    }
  }

  Future<bool> doComment(String postId) async {
    update();
    final SharedPreferences prefs = await _prefs;
    var userID = await prefs.getString("token");
    var name = await prefs.getString("name");
    try {
      Map body = {
        "post": postId,
        "name": name,
        "comment": commentcontroller.text
      };
      final response = await http.post(
        Uri.parse(URL.doComment),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print(response.statusCode);

      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body);

        isPosted.value = data['isposted'];
        print(isPosted.value);
        update();
        print(response.body);
        commentcontroller.clear();

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
    }
  }
}
