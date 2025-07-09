import 'package:demo/presentation/Homepage/widgets/FormReswerveDateDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class DateReserveField extends StatelessWidget {
  const DateReserveField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
      name: 'reserve_date',
      validator: FormBuilderValidators.required(errorText:'please select reserve date'),
      builder: (FormFieldState<DateTime?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                DateTime initial = field.value ?? DateTime.now();

                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: initial.isBefore(DateTime.now()) ? DateTime.now() : initial,
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
              child:  FormReswerveDateDecoration(
  value: field.value,
  errorText: field.errorText,
)),

          ],
        );
      },
    );
  }
}
