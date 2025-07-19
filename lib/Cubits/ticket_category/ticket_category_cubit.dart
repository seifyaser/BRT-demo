import 'package:bloc/bloc.dart';
import 'package:demo/Cubits/ticket_category/ticket_category_state.dart';
import 'package:dio/dio.dart';
import 'package:demo/models/TicketCategoryModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TicketCategoryCubit extends Cubit<TicketCategoryState> {
  TicketCategoryCubit() : super(TicketCategoryInitial());

  Future<void> fetchTicketCategory({
    required int fromStationId,
    required int toStationId,
  }) async {
    emit(TicketCategoryLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await Dio().get(
        "http://10.4.30.8:876/api/TicketCategory/ticketCategoryByStationCount",
        queryParameters: {
          "fromStation": fromStationId,
          "toStation": toStationId,
        },
          options: Options(
          headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      final data = TicketCategoryModel.fromJson(response.data);
      emit(TicketCategoryLoaded(data));
    } catch (e) {
      emit(TicketCategoryError('فشل في تحميل تفاصيل التذكرة'));
    }
  }
}

