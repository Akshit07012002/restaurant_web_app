import 'package:flutter/material.dart';
import 'package:restaurant_web_app/utils/constants.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight! * 3,
      padding: EdgeInsets.fromLTRB(
          screenWidth! * 0.1, 0, screenWidth! * 0.1, screenHeight! * 0.05),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => _menuCategory(index + 1),

        // children: [
        //   _menuCategory(1),
        //   _menuCategory(2),
        //   _menuCategory(3),
        //   _menuCategory(4),
        // ],
      ),
    );
  }

  _menuCategory(int i) => Card(
        child: ExpansionTile(
          title: Text(
            'Menu Category $i',
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth! * 0.035,
            ),
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Category Item ${index + 1}',
                  style: TextStyle(fontSize: screenWidth! * 0.03),
                ),
                subtitle: Text(
                  'Item ${index + 1}',
                  style: TextStyle(fontSize: screenWidth! * 0.025),
                ),
              ),
            ),
          ],
        ),
      );
}
