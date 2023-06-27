import 'package:flutter/material.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';

class MenuList extends StatelessWidget {
  final List<Categories> categories;
  const MenuList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight! * 3,
      padding: EdgeInsets.fromLTRB(
          screenWidth! * 0.1, 0, screenWidth! * 0.1, screenHeight! * 0.05),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => _menuCategory(categories[index]!),

        // children: [
        //   _menuCategory(1),
        //   _menuCategory(2),
        //   _menuCategory(3),
        //   _menuCategory(4),
        // ],
      ),
    );
  }

  _menuCategory(Categories categories) => Card(
        child: ExpansionTile(
          title: Text(
            '${categories.categoryName}',
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth! * 0.035,
            ),
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.dishes!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  '${categories.dishes![index].dishName}',
                  style: TextStyle(fontSize: screenWidth! * 0.03),
                ),
                subtitle: Text(
                  '\u20B9 ${categories.dishes![index].price}',
                  style: TextStyle(fontSize: screenWidth! * 0.025),
                ),
              ),
            ),
          ],
        ),
      );
}
