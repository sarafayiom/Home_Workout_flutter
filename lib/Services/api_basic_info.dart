import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homeworkout_flutter/Models/user_basic_info_model.dart';

class ApiBasicInfo extends GetConnect {
  final box = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://homeworkout-1.onrender.com';
    super.onInit();
  }

  Future<Map<String, String>> getHeaders() async {
    final token = box.read('access_token') ?? '';
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> updateUserBasicInfo(UserBasicInfoModel info) async {
    final headers = await getHeaders();

    final response = await patch(
      '/profile/basic-info/',
      info.toJson(),
      headers: headers,
    );

    return response;
  }
}
