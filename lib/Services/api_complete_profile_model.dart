import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homeworkout_flutter/Models/user_complete_profile_model.dart';

class ApiCompleteProfile extends GetConnect {
  final box = GetStorage();

  ApiCompleteProfile() {
    httpClient.baseUrl = 'http://127.0.0.1:8000/api';
  }

  Map<String, String> get headers {
    final token = box.read('access_token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> sendCompleteProfile(UserCompleteProfileModel data) async {
    final response = await patch(
      "/profile/days-time/", 
      data.toJson(),
      headers: headers,
    );
    return response;
  }
}