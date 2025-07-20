import 'package:demo/models/TransactionDetailsModel.dart';

class TransactionPostModel {
  final int shiftId;
  final List<TransactionDetailModel> transactionDetails;

  TransactionPostModel({
    required this.shiftId,
    required this.transactionDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'shiftId': shiftId,
      'transactionDetails': transactionDetails.map((e) => e.toJson()).toList(),
    };
  }
}
