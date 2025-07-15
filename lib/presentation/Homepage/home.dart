import 'dart:developer';
import 'package:demo/generated/l10n.dart';
import 'package:demo/models/StationsModel.dart';
import 'package:demo/presentation/Homepage/widgets/GreetingHeadline.dart';
import 'package:demo/presentation/Homepage/widgets/locationSelectColumn.dart';
import 'package:demo/services/get_stations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _selectedFromLocation;
  String? _selectedToLocation;
  final _formKey = GlobalKey<FormBuilderState>();

  StationModel? selectedFromStation;
  StationModel? selectedToStation;

  @override
  void initState() {
    super.initState();
    loadStations();
  }

  List<StationModel> stationList = [];

  Future<void> loadStations() async {
    try {
      stationList = await getStations();
      setState(() {});
    } catch (e) {
      log(' $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Greeting Header Container
            Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF427292), Color(0xFF3363FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(40),
                //   bottomRight: Radius.circular(40),
                // ),
              ),
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Greetingheadline(),
            ),

            // Form Content
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
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

                            ///////// location select column
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
                            SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!
                                        .saveAndValidate()) {
                                      final values =
                                          _formKey.currentState!.value;
                                      print(values);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF427292),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 60,
                                      vertical: 15,
                                    ),
                                  ),
                                  child: Text(
                                    S.of(context).findTransportationButton,
                                    style: TextStyle(
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

                    //    My Trips Section
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).MyTrips,
                            style: TextStyle(
                              color: Color(0xFF427292),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/reserve-screen');
                            },
                            child: Text(
                              S.of(context).showAll,
                              style: TextStyle(
                                color: Color(0xFF427292),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // const TicketCard(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
