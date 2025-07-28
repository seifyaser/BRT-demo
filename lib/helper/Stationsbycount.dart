import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getTicketCategory({
  required int fromStationId,
  required int toStationId,
}) async {
  final dio = Dio();
  final response = await dio.get(
    'http://10.4.30.8:876/api/TicketCategory/ticketCategoryByStationCount',
    queryParameters: {
      'fromStation': fromStationId,
      'toStation': toStationId,
    },
  );
  return response.data;
}
