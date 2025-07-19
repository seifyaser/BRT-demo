part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final dynamic responseData;
  SignUpSuccess(this.responseData);
}

class SignUpError extends SignUpState {
  final String error;
  SignUpError(this.error);
}
