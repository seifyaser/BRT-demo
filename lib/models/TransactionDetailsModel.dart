import 'package:demo/models/TicketCategoryModel.dart';

class TransactionDetailModel {
  final int count;
  final int ticketCategoryId;
  final int profileId;
  final String tripDate;

  // خصائص إضافية من السيرفر
  final String? id;
  final double? price;
  final TicketCategoryModel? ticketCategory;

  TransactionDetailModel({
    required this.count,
    required this.ticketCategoryId,
    required this.profileId,
    required this.tripDate,
    this.id,
    this.price,
    this.ticketCategory,
  });

  /// for sending to server
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'ticketCategoryId': ticketCategoryId,
      'profileId': profileId,
      'tripDate': tripDate,
    };
  }

  /// receive from server
  factory TransactionDetailModel.fromJson(Map<String, dynamic> json) {
    return TransactionDetailModel(
      count: json['count'],
      ticketCategoryId: json['ticketCategoryId'],
      profileId: json['profileId'],
      tripDate: json['tripDate'],
      id: json['id'], 
      price: (json['price'] as num?)?.toDouble(),
      ticketCategory: json['ticketCategory'] != null
          ? TicketCategoryModel.fromJson(json['ticketCategory'])
          : null,
    );
  }
}
