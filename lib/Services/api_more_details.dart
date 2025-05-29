
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homeworkout_flutter/Models/user_more_details_model.dart';

class ApiMoreDetails extends GetConnect {
  final box = GetStorage();

  ApiMoreDetails() {
    httpClient.baseUrl = 'https://homeworkout-1.onrender.com';
  }

  Map<String, String> get headers {
    final token = box.read('access_token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> sendMoreDetails(UserMoreDetailsModel data) async {
    final response = await patch(
      "/profile/more-details/",
      data.toJson(),
      headers: headers,
    );
    return response;
  }
}
