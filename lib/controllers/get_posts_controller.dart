import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/utils/url.dart';

class GetPostsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Post> myModel = <Post>[].obs;
  @override
  onInit() {
    super.onInit();
    getPost();
  }

  Future<bool> getPost() async {
    isLoading(true);
    update();

    try {
      final response = await http.get(
        Uri.parse(URL.getPosts),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("get posts called");

      // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // print(data);
        myModel.value =
            (data["posts"] as List).map((i) => Post.fromJson(i)).toList();

        return true;
      } else {}
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
      update();
      return false;
    }
  }
}
