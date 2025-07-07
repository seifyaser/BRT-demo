import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'FormBuilderDecoration.dart'; 

class DateOfBirthField extends StatelessWidget {
  const DateOfBirthField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
      name: 'date_of_birth',
      validator: FormBuilderValidators.required(
        errorText: 'Please enter your date of birth',
      ),
      builder: (FormFieldState<DateTime?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: field.value ?? DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
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
                  'Date of birth',
                  'Select date of birth',
                  const Icon(Icons.calendar_month, color: Colors.white),
                ).copyWith(errorText: field.errorText),
                child: Text(
                  field.value != null
                      ? DateFormat('dd/MM/yyyy').format(field.value!)
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),         
          ],
        );
      },
    );
  }
}
