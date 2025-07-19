import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:demo/models/StationsModel.dart';
import 'package:demo/utils/constants.dart';

part 'stations_state.dart';

class StationsCubit extends Cubit<StationsState> {
  StationsCubit() : super(StationsInitial());

  Future<void> fetchStations() async {
    emit(StationsLoading());

    final dio = Dio();
    final String url = GetStationsURL;

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final List<dynamic> data = response.data;
      final stations = data.map((json) => StationModel.fromJson(json)).toList();

      emit(StationsLoaded(stations));
    } on DioException  catch (e){
     if (e.type == DioExceptionType.connectionError)
 {
    emit(StationsError('no_internet'));
  } else {
    emit(StationsError(e.message ?? 'unknown error'));
  }
    } catch (_) {
      emit(StationsError("exception found"));
    }
  }
}
