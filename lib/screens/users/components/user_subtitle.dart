import 'package:flutter/material.dart';

class UserSubtitle extends Text {
  const UserSubtitle(
    String data, {
    TextStyle? style = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  }) : super(
          data,
          style: style,
        );
}
