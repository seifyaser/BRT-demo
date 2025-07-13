import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'FormBuilderDecoration.dart'; 

class DateField extends StatelessWidget {
  const DateField({super.key, required this.name, });
  final String name;

  @override
  Widget build(BuildContext context) {
    return  FormBuilderField<DateTime>(
    name: 'date_of_birth',
    validator: FormBuilderValidators.required(errorText: S.of(context).pleaseSelectDate),
    builder: (FormFieldState<DateTime?> field) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1960),
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
              decoration: 
              InputDecoration(
                labelText: S.of(context).datebirthlabel,
                labelStyle: const TextStyle(color: Color(0xffffffff)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                errorText: field.errorText,
                    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    ),
              ),
              child: Text(
                field.value != null
                    ? DateFormat('dd/MM/yyyy').format(field.value!)
                    : S.of(context).dateSelect,
                style: const TextStyle(color: Color.fromARGB(221, 255, 251, 251), fontSize: 16),
              ),
              ),
          ),
        ],
      );
    },
  );
  }
}
