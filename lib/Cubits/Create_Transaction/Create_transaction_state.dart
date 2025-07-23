import 'package:demo/models/TransactionDetailsModel.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionDetailModel> tickets;

  TransactionSuccess(this.tickets);
}


class TransactionError extends TransactionState {
  final String message;
  TransactionError(this.message);
}
