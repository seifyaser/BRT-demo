import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:demo/utils/constants.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> registerWithPhoneNumber(Map<dynamic, dynamic> formData) async {
    emit(SignUpLoading());

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

      emit(SignUpSuccess(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;

      // if phone exists
      final customError = data?['error']?['errors']?[0]?['errorEn'];
      if (customError != null) {
        emit(SignUpError(customError));
        return;
      }

      // validation errors
      final validationErrors = data?['errors'];
      if (validationErrors != null && validationErrors is Map) {
        final firstErrorList = validationErrors.values.first;
        if (firstErrorList is List && firstErrorList.isNotEmpty) {
          emit(SignUpError(firstErrorList.first));
          return;
        }
      }

      emit(SignUpError('حدث خطأ أثناء التسجيل'));
    } catch (e) {
      emit(SignUpError('حدث خطأ غير متوقع'));
    }
  }
}
