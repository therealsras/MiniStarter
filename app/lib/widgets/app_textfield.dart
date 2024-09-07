import 'dart:core';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.label,
      required this.placeholder,
      required this.formControlName,
      // this.validationMessages,
      this.obscureText})
      : super(key: key);
  final String label;
  final String placeholder;
  final String formControlName;
  // Map<String, String> Function(FormControl<Object?>)? validationMessages;
  bool? obscureText = false;

  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusedStyle = const TextStyle(color: Colors.green);
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          // formControlName: formControlName,
          // validationMessages: validationMessages,
          cursorColor: rwColor,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            hintText: placeholder,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            errorStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.apply(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
