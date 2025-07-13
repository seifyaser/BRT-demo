import 'package:demo/generated/l10n.dart';
import 'package:demo/presentation/Homepage/widgets/AvailableLinesHeader.dart';
import 'package:demo/presentation/Homepage/widgets/DateReserveField.dart';
import 'package:demo/presentation/Homepage/widgets/GreetingHeadline.dart';
import 'package:demo/presentation/Homepage/widgets/PriceField.dart';
import 'package:demo/presentation/Homepage/widgets/TicketCountField.dart';
import 'package:demo/presentation/Homepage/widgets/locationSelectRow.dart';
import 'package:demo/presentation/Homepage/widgets/paymentCardField.dart';
import 'package:demo/presentation/Homepage/widgets/ticketCard.dart';
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

  final List<String> locations = [
    'المعادي',
    'جسر السويس',
    'مدينة نصر',
    'التجمع الخامس',
  ];

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
              child:  Greetingheadline(),
            ),

            // Form Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                            AvailableLinesHeader(),
                            const SizedBox(height: 20),
                            LocationSelectorRow(
                              locations: locations,
                              selectedFrom: _selectedFromLocation,
                              selectedTo: _selectedToLocation,
                              onFromChanged: (value) {
                                setState(() => _selectedFromLocation = value);
                              },
                              onToChanged: (value) {
                                setState(() => _selectedToLocation = value);
                              },
                            ),
                            const SizedBox(height: 20),
                            const TicketCountField(),
                            const SizedBox(height: 20),
                            const DateReserveField(),
                            const SizedBox(height: 20),
                            const PaymentCardField(),
                            const SizedBox(height: 20),
                            PriceField(),
                            const SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.saveAndValidate()) {
                                    final values = _formKey.currentState!.value;
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
                                child:  Text(
                                  S.of(context).findTransportationButton,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // My Trips Section
                    Row(
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
                          child:  Text(
                            S.of(context).showAll,
                            style: TextStyle(
                              color: Color(0xFF427292),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const TicketCard(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   selectedItemColor: const Color(0xFF3363FF),
      //   unselectedItemColor: Colors.grey,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      //     BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'حجز التذكرة'),
      //     BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'المزيد'),
      //   ],
      // ),
    );
  }
}
