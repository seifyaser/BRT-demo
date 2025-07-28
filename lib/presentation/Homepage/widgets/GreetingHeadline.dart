import 'package:demo/Cubits/LanguageCubit/LanguageCubit.dart';
import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Greetingheadline extends StatelessWidget {
  Widget build(BuildContext context) {
    return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(S.of(context).morningDear, style: TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(height: 5),
                        Text(
                          S.of(context).whereAreYouGoingToday,
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                    


                  ],
                );
  }
}