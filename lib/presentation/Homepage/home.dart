import 'dart:developer';
import 'package:demo/generated/l10n.dart';
import 'package:demo/models/StationsModel.dart';
import 'package:demo/presentation/Homepage/widgets/BuildInfoTRIProw.dart';
import 'package:demo/presentation/Homepage/widgets/GreetingHeadline.dart';
import 'package:demo/presentation/Homepage/widgets/MyTripsRow.dart';
import 'package:demo/presentation/Homepage/widgets/locationSelectColumn.dart';
import 'package:demo/services/get_stations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

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

  List<StationModel> stationList = [];

  @override
  void initState() {
    super.initState();
    loadStations();
  }

  Future<void> loadStations() async {
    try {
      stationList = await getStations();
      setState(() {});
    } catch (e) {
      log('Error loading stations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 330,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF427292), Color(0xFF3363FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Greetingheadline(),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 180,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),

                  child: FormBuilder(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
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
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!
                                                .saveAndValidate() &&
                                            selectedFromStation != null &&
                                            selectedToStation != null) {
                                          setState(() {
                                            showTripDetails = true;
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFF427292,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 60,
                                          vertical: 15,
                                        ),
                                      ),
                                      child: Text(
                                        S.of(context).findTransportationButton,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        if (showTripDetails)
                          Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  buildInfoRow(
                                    "لون التذكرة",
                                    trailing: const Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                    ),
                                  ),
                                  buildInfoRow("عدد المحطات", value: "4"),
                                  buildInfoRow("السعر", value: "5.0 ج.م"),
                                  buildInfoRow(
                                    "تاريخ الحجز",
                                    value:
                                        selectedReserveDate != null
                                            ? DateFormat(
                                              'yyyy-MM-dd',
                                            ).format(selectedReserveDate!)
                                            : "اختر",
                                    onTap: () async {
                                      DateTime initial =
                                          selectedReserveDate ?? DateTime.now();
                                      DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate:
                                            initial.isBefore(DateTime.now())
                                                ? DateTime.now()
                                                : initial,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2030),
                                        builder: (context, child) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              colorScheme:
                                                  const ColorScheme.light(
                                                    primary: Color(0xff427292),
                                                    onPrimary: Colors.white,
                                                    onSurface: Colors.black,
                                                  ),
                                              textButtonTheme:
                                                  TextButtonThemeData(
                                                    style: TextButton.styleFrom(
                                                      foregroundColor: Color(
                                                        0xff427292,
                                                      ),
                                                    ),
                                                  ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                      );
                                      if (picked != null) {
                                        setState(() {
                                          selectedReserveDate = picked;
                                        });
                                      }
                                    },
                                  ),
                                  buildInfoRow("عدد التذاكر", value: "1"),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 10),
                        Mytripsrow(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
