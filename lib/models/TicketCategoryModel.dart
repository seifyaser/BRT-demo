class TicketCategoryModel {
  final String color;
  final String hexCode;
  final int stationCount;
  final double price;
  final int ticketTypeId;
  final int maxCount;
  final bool isDeleted;
  final String nameAr;
  final String nameEn;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final int id;

  TicketCategoryModel({
    required this.color,
    required this.hexCode,
    required this.stationCount,
    required this.price,
    required this.ticketTypeId,
    required this.maxCount,
    required this.isDeleted,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.modifiedAt,
    required this.id,
  });

  factory TicketCategoryModel.fromJson(Map<String, dynamic> json) {
    return TicketCategoryModel(
      color: json['color'] ?? '',
      hexCode: json['hexCode'] ?? '',
      stationCount: json['stationCount'] ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      ticketTypeId: json['ticketTypeId'] ?? 0,
      maxCount: json['maxCount'] ?? 0,
      isDeleted: json['isDeleted'] ?? false,
      nameAr: json['nameAr'] ?? '',
      nameEn: json['nameEn'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      modifiedAt: DateTime.tryParse(json['modifiedAt'] ?? '') ?? DateTime.now(),
      id: json['id'] ?? 0,
    );
  }
}
