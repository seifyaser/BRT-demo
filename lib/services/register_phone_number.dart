import 'package:demo/utils/constants.dart';
import 'package:dio/dio.dart';

Future<void> registerWithPhoneNumber(Map<dynamic, dynamic> formData) async {
  final dio = Dio();
  final String url = RegisterByPhoneNumberURL;

  try {
    final response = await dio.post(
      url,
      data: {
        "phoneNumber": formData['phone_number'],
        "password": formData['password'],
        "confirmPassword": formData['confirm_password'],
      },
      options: Options(
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
      ),
    );

    print(' Success: ${response.data}');
  } on DioException catch (e) {
    final data = e.response?.data;

    // phone number exist
    final customError = data?['error']?['errors']?[0]?['errorEn'];
    if (customError != null) {
      throw customError ?? 'حدث خطا';
    }
    
    // validation passwords
    final validationErrors = data?['errors'];
    if (validationErrors != null && validationErrors is Map) {
      final firstErrorList = validationErrors.values.first;
      if (firstErrorList is List && firstErrorList.isNotEmpty) {
        throw firstErrorList.first;
      }
    }
  } catch (e) {
    throw 'حدث خطأ غير متوقع';
  }
}
