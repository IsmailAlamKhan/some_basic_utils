import 'package:flutter/material.dart';

import '../src.dart';

class GroupRadioFormField<T> extends FormField<T> {
  final List<IsmailFormFieldItem<T>> options;
  final ValueChanged<List<T>> onChanged;
  final ControlAffinity controlAffinity;
  final InputDecoration? decoration;
  @override
  final FormFieldValidator<T>? validator;
  @override
  final bool enabled;

  GroupRadioFormField({
    required this.options,
    required this.onChanged,
    this.controlAffinity = ControlAffinity.leading,
    this.decoration,
    this.validator,
    AutovalidateMode? autovalidateMode,
    this.enabled = true,
    T? initialValue,
  }) : super(
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: (field) => InputDecorator(
            decoration: decoration?.copyWith(
                  errorText: field.errorText,
                ) ??
                InputDecoration(
                  errorText: field.errorText,
                ),
            child: GroupRadio<T>(
              controlAffinity: controlAffinity,
              onChanged: field.didChange,
              options: options,
              value: field.value,
            ),
          ),
        );
}
