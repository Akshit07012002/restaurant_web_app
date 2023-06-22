import 'package:flutter/material.dart';
import 'package:restaurant_web_app/pages/nav_bar.dart';
import 'package:restaurant_web_app/utils/constants.dart';
import 'package:restaurant_web_app/widgets/carousel.dart';
import 'package:restaurant_web_app/widgets/menu_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const NavBar(),
              SizedBox(height: screenHeight! * 0.05),
              const Carousel(),
              SizedBox(height: screenHeight! * 0.05),
              const Text(
                'Our Menu',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight! * 0.05),
              MenuList(),
            ],
          ),
        ),
      ),
    );
  }
}
