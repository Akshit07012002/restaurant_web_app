import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web_app/bloc/cart/cart_bloc.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/dish_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';
import 'package:restaurant_web_app/widgets/menu_dialog.dart';
import 'package:restaurant_web_app/widgets/menu_list.dart';
import 'package:restaurant_web_app/widgets/title_card.dart';

class HomePage extends StatelessWidget {
  final List<Categories> categories;
  HomePage({super.key, required this.categories});

  final GlobalKey fabKey = GlobalKey();

  final List<GlobalKey> categoryCardKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      Map<Dishes, int> cartItems = state.cart;
      return Scaffold(
        floatingActionButton: Container(
          key: fabKey,
          height: screenHeight! * 0.08,
          width: screenWidth! * 0.3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              showMenuDialog(context, categories, categoryCardKeys, cartItems);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood_rounded,
                  color: Colors.yellow[400],
                ),
                const SizedBox(width: 10),
                Text(
                  'MENU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth! * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            SizedBox(height: screenHeight! * 0.05),
            const TitleCard(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight! * 0.05),
                    MenuList(
                      categories: categories,
                      categoryCardKeys: categoryCardKeys,
                      cartItems: cartItems.keys.toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
