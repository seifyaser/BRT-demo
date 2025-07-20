class TransactionDetailModel {
  final int count;
  final int ticketCategoryId;
  final int profileId;
  final String tripDate;

  TransactionDetailModel({
    required this.count,
    required this.ticketCategoryId,
    required this.profileId,
    required this.tripDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'ticketCategoryId': ticketCategoryId,
      'profileId': profileId,
      'tripDate': tripDate,
    };
  }
}
