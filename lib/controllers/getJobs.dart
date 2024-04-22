import 'dart:convert';

import 'package:get/get.dart';
import 'package:sehyogini_frontned/models/jobs.dart';
import 'package:http/http.dart' as http;
import 'package:sehyogini_frontned/utils/url.dart';

class GetJobsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<jobModel> myModelTech = <jobModel>[].obs;
  RxList<jobModel> myModelFree = <jobModel>[].obs;
  RxList<jobModel> myModelCraft = <jobModel>[].obs;
  RxList<jobModel> myModelPhil = <jobModel>[].obs;
  RxList<jobModel> myModelCare = <jobModel>[].obs;
  @override
  onInit() {
    super.onInit();
    getJob();
  }

  Future<bool?> getJob() async {
    isLoading(true);
    update();

    try {
      final response = await http.get(
        Uri.parse(URL.getJobs),
        headers: {"Content-Type": "application/json", 'Accept': '*/*'},
      );

      print("get jobs called");

      // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["technology"]);
        myModelTech.value = (data["technology"] as List)
            .map((i) => jobModel.fromJson(i))
            .toList();
        myModelCraft.value = (data["craftsmanship"] as List)
            .map((i) => jobModel.fromJson(i))
            .toList();
        myModelPhil.value = (data["philanthropy"] as List)
            .map((i) => jobModel.fromJson(i))
            .toList();
        myModelCare.value = (data["caregiving"] as List)
            .map((i) => jobModel.fromJson(i))
            .toList();
        myModelFree.value = (data["freelance"] as List)
            .map((i) => jobModel.fromJson(i))
            .toList();

        return true;
      } else {
        print(response);
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      return false;
    } finally {
      isLoading(false);
      update();
    }
  }
}
