import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/utils/url.dart';

class GetPostByIdController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<Post> myModelPost = Post().obs;
  @override
  onInit() {
    super.onInit();
  }

  Future<Post> getPostById(String id) async {
    isLoading(true);
    update();

    try {
      var url = Uri.parse("${URL.getPostsById}$id");
      // print(url);
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("get posts called");

      // print(response.body);
      Post myModelPost;
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        myModelPost = Post.fromJson(data['user']);
        return myModelPost;
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      print(e.toString());
      throw "Unknow Error Occured";
    } finally {
      isLoading(false);
      update();
    }
  }
}
