// Eng Mouaz M. Al-Shahmeh
 
import 'package:flutter/material.dart';

textInputDecoration(String text) => InputDecoration(
  hintText: text,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pink,
      width: 1.0,
    ),
  ),
);
