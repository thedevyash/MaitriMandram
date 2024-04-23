import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/jobs.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/models/product.dart';
import 'package:sehyogini_frontned/models/productForCart.dart';
import 'package:sehyogini_frontned/models/scheme.dart';
import 'package:sehyogini_frontned/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserCartController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<productForCart> products = <productForCart>[].obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool?> getUserCart() async {
    isLoading(true);
    update();
    final SharedPreferences prefs = await _prefs;
    var userID = await prefs.getString("token");
    try {
      var uri = Uri.parse("${URL.getUserCart}/${userID}");
      final response = await http.get(
        uri,
        // Replace 'body' with the correct named parameter or define a named parameter with the name 'body',
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );
      print(uri);
      // print("get posts called");

      // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        products.value =
            (data as List).map((i) => productForCart.fromJson(i)).toList();
        print(products);
        return true;
      } else {}
    } catch (e) {
      print(e.toString());
      return false;
    } finally {
      isLoading(false);
      update();
    }
  }
}
