import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web_app/bloc/cart/cart_bloc.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/dish_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';
import 'package:restaurant_web_app/widgets/menu_list.dart';
import 'package:restaurant_web_app/widgets/title_card.dart';

class HomePage extends StatelessWidget {
  final List<Categories> categories;
  HomePage({super.key, required this.categories});

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
    return Scaffold(
      floatingActionButton: Container(
        height: screenHeight! * 0.08,
        width: screenWidth! * 0.3,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PopupMenuButton(
          position: PopupMenuPosition.under,
          offset: Offset(0, 2000),
          child: Center(
            child: Text(
              'MENU',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth! * 0.04,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('${categories[0].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[0].currentContext!);
              },
            ),
            PopupMenuItem(
              child: Text('${categories[1].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[1].currentContext!);
              },
            ),
            PopupMenuItem(
              child: Text('${categories[2].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[2].currentContext!);
              },
            ),
            PopupMenuItem(
              child: Text('${categories[3].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[3].currentContext!);
              },
            ),
            PopupMenuItem(
              child: Text('${categories[4].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[4].currentContext!);
              },
            ),
            PopupMenuItem(
              child: Text('${categories[5].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[5].currentContext!);
              },
            ),
            PopupMenuItem(
              child: Text('${categories[6].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[6].currentContext!);
              },
            ),
            PopupMenuItem(
              child: Text('${categories[7].categoryName}'),
              onTap: () {
                Scrollable.ensureVisible(categoryCardKeys[7].currentContext!);
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          List<Dishes> cartItems = state.cart;
          return Column(
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
                      MenuList(
                          categories: categories,
                          categoryCardKeys: categoryCardKeys,
                          cartItems: cartItems
                          ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
