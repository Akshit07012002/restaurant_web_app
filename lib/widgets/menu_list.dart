import 'package:flutter/material.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/dish_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';
import 'package:restaurant_web_app/widgets/add_to_cart_button.dart';

class MenuList extends StatelessWidget {
  final List<Categories> categories;
  final List<GlobalKey> categoryCardKeys;
  final List<Dishes> cartItems;
  const MenuList(
      {super.key, required this.categories, required this.categoryCardKeys, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight! * 3,
      padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight! * 0.05),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            _menuCategory(categories[index], categoryCardKeys[index]),
      ),
    );
  }

  _menuCategory(Categories categories, GlobalKey expansionCardKey) => Card(
        child: ExpansionTile(
          key: expansionCardKey,
          title: Text(
            '${categories.categoryName}',
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth! * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.dishes!.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black87,
                thickness: 1,
              ),
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  '${categories.dishes![index].dishName}',
                  style: TextStyle(
                    fontSize: screenWidth! * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                subtitle: Text(
                  '\u20B9 ${categories.dishes![index].price}',
                  style: TextStyle(
                    fontSize: screenWidth! * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                trailing: SizedBox(
                    height: screenHeight! * 0.053,
                    width: screenWidth! * 0.28,
                    child: addToCartButton(context, cartItems, categories.dishes![index])),
              ),
            ),
          ],
        ),
      );
}
