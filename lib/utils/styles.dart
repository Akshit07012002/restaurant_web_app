
import 'package:flutter/material.dart';

ButtonStyle borderedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(
    Colors.white,
  ),
  side: MaterialStateProperty.all(
    const BorderSide(
      color: Colors.deepPurple,
      width: 2,
    ),
  ),
);