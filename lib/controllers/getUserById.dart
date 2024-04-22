import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/models/user.dart';
import 'package:sehyogini_frontned/utils/url.dart';

class GetUserByIdController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<UserModel> myUser = UserModel().obs;
  @override
  onInit() {
    super.onInit();
  }

  Future<bool> getUserById(String id) async {
    isLoading(true);
    update();

    try {
      var url = Uri.parse("${URL.getUserById}$id");
      print(url);
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("get posts called");

      // print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        myUser.value = UserModel.fromJson(data['user']);
        return true;
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
