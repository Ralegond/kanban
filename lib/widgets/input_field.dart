import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(
      {Key? key,
      required this.placeholder,
      required this.errorText,
      required this.initialValue,
      required this.onChanged})
      : super(key: key);

  String placeholder;
  String errorText;
  String initialValue;
  Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(40.0),
            ),
          ),
          hintText: placeholder,
          errorText: errorText,
          isDense: true,
          contentPadding: EdgeInsets.all(14),
        ),
      ),
    );
  }
}
