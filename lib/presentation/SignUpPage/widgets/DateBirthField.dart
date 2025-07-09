import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'FormBuilderDecoration.dart'; 

class DateField extends StatelessWidget {
  const DateField({super.key, required this.name,  this.errorText});
  final String name;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return  FormBuilderField<DateTime>(
    name: 'date_of_birth',
    validator: FormBuilderValidators.required(errorText: 'please select date'),
    builder: (FormFieldState<DateTime?> field) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Color(0xff427292),
                        onPrimary: Colors.white,
                        onSurface: Colors.black,
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Color(0xff427292),
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (picked != null) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  field.didChange(picked);
                  field.validate();
                });
              }
            },
            child: InputDecorator(
              decoration: FormBuilderDecoration(
                'Date of Birth',
                'select your date of birth',
              )),
          ),
        ],
      );
    },
  );
  }
}
