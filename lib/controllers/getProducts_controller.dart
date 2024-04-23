import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/jobs.dart';
import 'package:sehyogini_frontned/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/models/product.dart';
import 'package:sehyogini_frontned/models/scheme.dart';
import 'package:sehyogini_frontned/utils/url.dart';

class GetProductController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<product> products = <product>[].obs;

  @override
  onInit() {
    super.onInit();
    getProducts();
  }

  Future<bool?> getProducts() async {
    isLoading(true);
    update();

    try {
      final response = await http.get(
        Uri.parse(URL.getProducts),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      // print("get posts called");

      // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        products.value =
            (data["products"] as List).map((i) => product.fromJson(i)).toList();

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
