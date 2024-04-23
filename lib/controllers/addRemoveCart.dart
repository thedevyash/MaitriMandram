import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCartController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<Post> myModelPost = Post().obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> addtocart(String productId) async {
    isLoading(true);
    update();
    final SharedPreferences prefs = await _prefs;
    var userID = await prefs.getString("token");
    try {
      var url = Uri.parse(URL.addToCart);
      // print(url);
      Map body = {"userId": userID, "productId": productId};
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("get posts called");

      // print(response.body);

      if (response.statusCode == 200) {
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

  Future<bool> removeFromCart(String productId) async {
    isLoading(true);
    update();
    final SharedPreferences prefs = await _prefs;
    var userID = await prefs.getString("token");
    try {
      var url = Uri.parse(URL.removeFromCart);
      // print(url);
      Map body = {"userId": userID, "productId": productId};
      final response = await http.delete(
        url,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("get posts called");

      // print(response.body);

      if (response.statusCode == 200) {
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
