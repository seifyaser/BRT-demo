import 'dart:developer';
import 'package:demo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';

Future<void> loginWithPhoneNumber(Map<String, dynamic> formData) async {
  final dio = Dio();
  final String url = LoginByPhoneNumberURL;

  try {
    final response = await dio.post(
      url,
      data: {
        "phoneNumber": formData['phone_number'],
        "password": formData['password'],
      },
      options: Options(
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
      ),
    );

    log(' Logged in: ${response.data}');

 // get token
final token = response.data['data']['token'];
   log(token);
   // save token
final prefs = await SharedPreferences.getInstance();
await prefs.setString('token', token);

  } on DioException catch (e) {
    final data = e.response?.data;

    final validationErrors = data?['errors'];
    if (validationErrors != null && validationErrors is Map) {
      final firstErrorList = validationErrors.values.first;
      if (firstErrorList is List && firstErrorList.isNotEmpty) {
        throw firstErrorList.first;
      }
    }



 // if phone not valid
  // final errorMessage = data?['errors']?.values?.first?[2];
  //   throw errorMessage ?? 'فشل في تسجيل الدخول';
  } catch (e) {
    throw "eror";
  }
}
