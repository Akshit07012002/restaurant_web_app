import 'package:flutter/material.dart';
import 'package:restaurant_web_app/pages/home_page.dart';
import 'package:restaurant_web_app/utils/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
      ),
      home: const HomePage(),
    );
  }
}
