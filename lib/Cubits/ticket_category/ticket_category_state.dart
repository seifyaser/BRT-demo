import 'package:demo/models/TicketCategoryModel.dart';

abstract class TicketCategoryState {}

class TicketCategoryInitial extends TicketCategoryState {}

class TicketCategoryLoading extends TicketCategoryState {}

class TicketCategoryLoaded extends TicketCategoryState {
  final TicketCategoryModel ticket;

  TicketCategoryLoaded(this.ticket);
}

class TicketCategoryError extends TicketCategoryState {
  final String message;

  TicketCategoryError(this.message);
}
