import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:demo/Cubits/Create_Transaction/Create_transaction_state.dart';
import 'package:demo/models/TransactionDetailsModel.dart';
import 'package:demo/models/TransactionPostModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> createTransaction(TransactionPostModel transaction) async {
    emit(TransactionLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await Dio().post(
        'http://10.4.30.8:876/api/Transaction/CreateTransaction',
        data: transaction.toJson(),
        options: Options(
          headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

     if (response.statusCode == 200) {
  log("Response data: ${response.data}");

  final data = response.data;
  final List<dynamic> detailsJson = data['data']['transactionDetails'];

  final tickets = detailsJson.map((e) => TransactionDetailModel.fromJson(e)).toList();

  emit(TransactionSuccess(tickets)); 
}
 else {
        emit(TransactionError("error creating transaction ${response.statusCode}"));
        // log(response.data);
      }
    } catch (e) {
      emit(TransactionError("خطأ :${e.toString()}"));
    }
  }
}
