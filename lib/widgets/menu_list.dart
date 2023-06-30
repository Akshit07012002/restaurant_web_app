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
      {super.key,
      required this.categories,
      required this.categoryCardKeys,
      required this.cartItems});


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
        margin: EdgeInsets.symmetric(
            horizontal: screenWidth! * 0.03, vertical: screenHeight! * 0.005),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.025),
          child: ExpansionTile(
            key: expansionCardKey,
            collapsedShape: const Border(
              bottom: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
           
            textColor: Colors.black,
            iconColor: Colors.black,
            title: Text(
              '${categories.categoryName}',
              style: TextStyle(
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
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/dqs8554a6/image/upload/v1679922050/vege_m7csce.jpg',
                        height: 25,
                        width: 25,
                        // '${categories.dishes![index].dishImage}',
                        // fit: BoxFit.cover,
                      ),
                    ],
                  ),
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
                    child: addToCartButton(
                      context,
                      // cartItems,
                      categories.dishes![index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
