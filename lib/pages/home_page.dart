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
          child: PopupMenuButton(
            // position: PopupMenuPosition.under,
            constraints: BoxConstraints(
              maxHeight: screenHeight! * 0.5,
              maxWidth: screenWidth! * 0.3,
            ),
            offset: const Offset(0, 400),
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
                child: Center(
                  child: Text('MENU',
                  textAlign: TextAlign.center,
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),),
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[0].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[0].currentContext!);
                },
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[1].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[1].currentContext!);
                },
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[2].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[2].currentContext!);
                },
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[3].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[3].currentContext!);
                },
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[4].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[4].currentContext!);
                },
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[5].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[5].currentContext!);
                },
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[6].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[6].currentContext!);
                },
              ),
              PopupMenuItem(
                child: Text(
                  '${categories[7].categoryName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Scrollable.ensureVisible(categoryCardKeys[7].currentContext!);
                },
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
