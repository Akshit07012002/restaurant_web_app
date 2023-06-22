import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:restaurant_web_app/utils/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => _mobileNavBar(),
      // tablet: (BuildContext context) => _tabletNavBar(),
      desktop: (BuildContext context) => _desktopNavBar(),
    );
  }

  Widget _mobileNavBar() {
    return Container(
      height: 80,
      color: const Color.fromARGB(255, 30, 14, 74),
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Restaurant App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth! * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
              SizedBox(width: screenWidth! * 0.05),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _desktopNavBar() {
    return Container(
      height: 80,
      color: const Color.fromARGB(255, 30, 14, 74),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
          Text(
            'Restaurant App',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth! * 0.025,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
