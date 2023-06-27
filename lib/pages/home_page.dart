import 'package:flutter/material.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/pages/nav_bar.dart';
import 'package:restaurant_web_app/utils/constants.dart';
import 'package:restaurant_web_app/widgets/carousel.dart';
import 'package:restaurant_web_app/widgets/menu_list.dart';
import 'package:restaurant_web_app/widgets/title_card.dart';

class HomePage extends StatelessWidget {
  final List<Categories> categories;
  const HomePage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Container(
        height: screenHeight! * 0.08,
        width: screenWidth! * 0.3,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PopupMenuButton(
          position: PopupMenuPosition.over,
          child: Center(
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth! * 0.03,
              ),
            ),
          ),
          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text('Menu 1'),
            ),
            const PopupMenuItem(
              child: Text('Menu 2'),
            ),
            const PopupMenuItem(
              child: Text('Menu 3'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          SizedBox(height: screenHeight! * 0.05),
          const TitleCard(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const NavBar(),

                  SizedBox(height: screenHeight! * 0.05),
                  // const Carousel(),
                  // SizedBox(height: screenHeight! * 0.05),
                  // const Text(
                  //   'Our Menu',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: screenHeight! * 0.05),
                  MenuList(categories: categories),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
