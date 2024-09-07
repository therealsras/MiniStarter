import 'package:flutter/material.dart';

import '../config/config.dart';

class AppSubmitButton extends StatelessWidget {
  final String label;
  Function() onPress;
  AppSubmitButton({Key? key, required this.label, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final form = ReactiveForm.of(context);
    return SizedBox(
      height: 50,
      child: MaterialButton(
        color: colorPrimary,
        disabledColor: colorGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        // onPressed: form!.valid ? onPress : null,
        onPressed: () => {},
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
