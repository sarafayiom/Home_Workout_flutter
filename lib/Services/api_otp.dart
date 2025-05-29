import 'package:get/get.dart';
import 'package:homeworkout_flutter/Models/otp_verify_model.dart';

class ApiOtp extends GetConnect {
  
  ApiOtp({String baseUrl  = "http://192.168.1.10:8000/api"}) {
    httpClient.baseUrl = baseUrl;
  }

  Future<Response> verifyOtp(OtpVerifyModel data) {
    return post(
      '/verify-otp/',
      data.toJson(),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> resendOtp(String email) async {
    try {
      final response = await post(
        '/resend-otp/',
        {'email': email},
        headers: {'Content-Type': 'application/json'},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
