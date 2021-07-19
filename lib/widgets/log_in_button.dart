import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {
  LogInButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  Widget child;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 40.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }
}
