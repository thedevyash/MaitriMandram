import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/jobs.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/models/scheme.dart';
import 'package:sehyogini_frontned/utils/url.dart';

class GetSchemeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<schemeModel> myscheme = <schemeModel>[].obs;

  @override
  onInit() {
    super.onInit();
    getScheme();
  }

  Future<bool?> getScheme() async {
    isLoading(true);
    update();

    try {
      final response = await http.get(
        Uri.parse(URL.getSchemes),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("get posts called");

      // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        myscheme.value =
            (data as List).map((i) => schemeModel.fromJson(i)).toList();

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
