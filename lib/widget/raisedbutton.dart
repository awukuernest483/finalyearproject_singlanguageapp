import 'package:flutter/material.dart';

final ButtonStyle RaisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.white,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);
