import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton(
      {super.key, required this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(
          12.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey,
            border: Border.all(
              color: Colors.black,
            )),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
