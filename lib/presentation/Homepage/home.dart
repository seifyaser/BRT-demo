import 'package:demo/Cubits/Create_Transaction/Create_transaction_cubit.dart';
import 'package:demo/Cubits/Create_Transaction/Create_transaction_state.dart';
import 'package:demo/Cubits/get_Stations/stations_cubit.dart';
import 'package:demo/Cubits/ticket_category/ticket_category_cubit.dart';
import 'package:demo/Cubits/ticket_category/ticket_category_state.dart';
import 'package:demo/generated/l10n.dart';
import 'package:demo/models/StationsModel.dart';
import 'package:demo/models/TransactionDetailsModel.dart';
import 'package:demo/models/TransactionPostModel.dart';
import 'package:demo/presentation/Homepage/widgets/AvailableLinesHeader.dart';
import 'package:demo/presentation/Homepage/widgets/CustomTripDetailsCard.dart';
import 'package:demo/presentation/Homepage/widgets/HomeHeaderDecoration.dart';
import 'package:demo/presentation/Homepage/widgets/MyTripsRow.dart';
import 'package:demo/presentation/Homepage/widgets/SearchStylebutton.dart';
import 'package:demo/presentation/Homepage/widgets/locationSelectColumn.dart';
import 'package:demo/routes/app_routes.dart';
import 'package:demo/utils/NoInternetWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormBuilderState>();

  StationModel? selectedFromStation;
  StationModel? selectedToStation;
  DateTime? selectedReserveDate;
  bool showTripDetails = false;
  int? ticketCount;

 @override
Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => StationsCubit()..fetchStations()),
      BlocProvider(create: (_) => TicketCategoryCubit()),
      BlocProvider(create: (_) => TransactionCubit()),
    ],
    child: BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, tState) {
        if (tState is TransactionSuccess) {
          Navigator.pushNamed(
            context,
            AppRoutes.reserveScreen,
            arguments: tState.tickets,
          );
        } else if (tState is TransactionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(tState.message)),
          );
        }
      },
      builder: (context, tState) {
        bool isLoading = tState is TransactionLoading;

        return AbsorbPointer(
          absorbing: isLoading,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.grey[100],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          HomeHeaderDecoration(),
                          Padding(
                            padding: const EdgeInsets.only(top: 180, left: 20, right: 20, bottom: 20),
                            child: BlocBuilder<StationsCubit, StationsState>(
                              builder: (context, state) {
                                if (state is StationsError) {
                                  if (state.message == 'no_internet') {
                                    return noInternetWidget();
                                  }
                                  return Center(child: Text('${state.message}'));
                                }
                                if (state is StationsLoaded) {
                                  final stationList = state.stations;
                                  return FormBuilder(
                                    key: _formKey,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    child: Column(
                                      children: [
                                        Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                AvailableLinesHeader(),
                                                const SizedBox(height: 25),
                                                LocationSelectorColumn(
                                                  stations: stationList,
                                                  selectedFrom: selectedFromStation,
                                                  selectedTo: selectedToStation,
                                                  onFromChanged: (station) {
                                                    setState(() {
                                                      selectedFromStation = station;
                                                    });
                                                  },
                                                  onToChanged: (station) {
                                                    setState(() {
                                                      selectedToStation = station;
                                                    });
                                                  },
                                                  onSwapPressed: () {
                                                    setState(() {
                                                      final temp = selectedFromStation;
                                                      selectedFromStation = selectedToStation;
                                                      selectedToStation = temp;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(height: 20),
                                                Center(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        if (_formKey.currentState!.saveAndValidate() &&
                                                            selectedFromStation != null &&
                                                            selectedToStation != null) {
                                                          context.read<TicketCategoryCubit>().fetchTicketCategory(
                                                                fromStationId: selectedFromStation!.id,
                                                                toStationId: selectedToStation!.id,
                                                              );
                                                          setState(() {
                                                            showTripDetails = true;
                                                          });
                                                        }
                                                      },
                                                      style: searchButtonStyle(),
                                                      child: Text(S.of(context).findTransportationButton),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        if (showTripDetails)
                                          BlocBuilder<TicketCategoryCubit, TicketCategoryState>(
                                            builder: (context, state) {
                                              if (state is TicketCategoryLoading) {
                                                return const Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: CircularProgressIndicator(),
                                                );
                                              }

                                              if (state is TicketCategoryLoaded) {
                                                final ticketDetails = state.ticket;
                                                return CustomTripDetailsCard(
                                                  selectedReserveDate: selectedReserveDate,
                                                  onDateTap: () async {
                                                    DateTime initial = selectedReserveDate ?? DateTime.now();
                                                    DateTime? picked = await showDatePicker(
                                                      context: context,
                                                      initialDate: initial.isBefore(DateTime.now())? DateTime.now(): initial,
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(2030),
                                                    );
                                                    if (picked != null) {
                                                      setState(() { selectedReserveDate = picked;});
                                                    }
                                                  },
                                                  ticket: ticketDetails,
                                                  ticketCount: ticketCount ?? 1,
                                                  onCountChanged: (newCount) {
                                                    setState(() {
                                                      ticketCount = newCount;
                                                    });
                                                  },
                                                  onReserve: () {
                                                    if (selectedReserveDate == null) {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(content: Text(S.of(context).pleaseSelectDate)));
                                                      return;
                                                    }

                                                    final transaction = TransactionPostModel(
                                                      shiftId: 3,
                                                      transactionDetails: [
                                                        TransactionDetailModel(
                                                          count: ticketCount ?? 1,
                                                          ticketCategoryId: ticketDetails.id,
                                                          profileId: 1,
                                                          tripDate: selectedReserveDate!.toIso8601String(),
                                                        ),
                                                      ],
                                                    );

                                                    context.read<TransactionCubit>().createTransaction(transaction);
                                                  },
                                                );
                                              }

                                              if (state is TicketCategoryError) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: Text(state.message),
                                                );
                                              }

                                              return const SizedBox(); // Default placeholder
                                            },
                                          ),
                                      ],
                                    ),
                                  );
                                }
                                return const Center(child: CircularProgressIndicator());
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Mytripsrow(),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                const Positioned.fill(
                  child: ColoredBox(
                    color: Colors.black38,
                    child: Center(child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 7, 66, 94),
                    )),
                  ),
                ),
            ],
          ),
        );
      },
    ),
  );
}
}