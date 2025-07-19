part of 'stations_cubit.dart';

@immutable
abstract class StationsState {}

class StationsInitial extends StationsState {}

class StationsLoading extends StationsState {}

class StationsLoaded extends StationsState {
  final List<StationModel> stations;
  StationsLoaded(this.stations);
}

class StationsError extends StationsState {
  final String message;
  StationsError(this.message);
}
