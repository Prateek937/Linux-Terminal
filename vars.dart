import 'package:flutter/material.dart';

var btn = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.purple,
);

var navTop = AppBar(
  toolbarHeight: 70,
  backgroundColor: Colors.grey.shade700,
  title: Text(
    "LINUX TERMINAL",
    style: TextStyle(fontSize: 25, letterSpacing: 1.5),
  ),
);
