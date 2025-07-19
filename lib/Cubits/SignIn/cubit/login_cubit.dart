import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/utils/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginWithPhoneNumber(Map<String, dynamic> formData) async {
    emit(LoginLoading());

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

      log('Logged in: ${response.data}');

      final token = response.data['data']['token'];
      log(token);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      emit(LoginSuccess(token));
    } on DioException catch (e) {
      final data = e.response?.data;

      final validationErrors = data?['errors'];
      if (validationErrors != null && validationErrors is Map) {
        final firstErrorList = validationErrors.values.first;
        if (firstErrorList is List && firstErrorList.isNotEmpty) {
          emit(LoginError(firstErrorList.first));
          return;
        }
      }

      emit(LoginError("فشل في تسجيل الدخول"));
    } catch (e) {
      emit(LoginError("حدث خطأ غير متوقع"));
    }
  }
}
