import 'package:demo/models/StationsModel.dart';
import 'package:demo/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<StationModel>> getStations() async {
  final dio = Dio();
 final String url = GetStationsURL;
 
 // get token stored locally from shared preferences
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  try {
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
    return data.map((json) => StationModel.fromJson(json)).toList();
  } on DioException catch (e) {
    throw 'فشل في تحميل المحطات';
  }
}
