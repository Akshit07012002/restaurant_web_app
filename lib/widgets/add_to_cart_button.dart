import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web_app/bloc/cart/cart_bloc.dart';
import 'package:restaurant_web_app/models/dish_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';

BlocBuilder<CartBloc, CartState> addToCartButton(
  BuildContext context,
  // List<Dishes> cartItems,
  Dishes dish,
) {
  Map<String, dynamic> cartStash = {};
  // int totalCartSize = 0;

  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      Map<Dishes, int> cartItems = state.cart;
      int totalCartSize = state.totalCartSize;

      if (!cartItems.containsKey(dish) || cartItems[dish] == 0) {
        return ElevatedButton(
          onPressed: () {
            // if (cartItems.contains(dish)) {
            //   // cartItems.remove(dish);

            // } else {
            // }
            // if (cartItems[dish] == 0) {
            //   cartItems.remove(dish);
            // } else if (cartItems.containsKey(dish)) {
            // } else {
            cartItems[dish] = 0;
            // }

            context.read<CartBloc>().add(AddToCartEvent(dish));
            print('add button cart size : ${cartItems[dish]}');

            print(state.cart);

            showBottomSheet(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 15),
                child: FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 2)),
                    builder: (context, snapshot) {
                      print('cart size : $totalCartSize');
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                        ),
                        title: Text(
                          (totalCartSize == 1)
                              ? 'You have $totalCartSize item in your cart'
                              : 'You have $totalCartSize items in your cart',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: screenWidth! * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                            child: Text(
                              'Checkout',
                              style: TextStyle(color: Colors.yellow[400]),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/order');
                            }),
                      );
                    }),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          child: Text(
            'ADD',
            style: TextStyle(
              color: Colors.yellow[400],
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: screenWidth! * 0.03,
            ),
          ),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    // cartItems[dish] = cartItems[dish]! - 1;
                    context.read<CartBloc>().add(RemoveFromCartEvent(dish));
                    print('cart size : ${cartItems[dish]}');

                    print(state.cart);

                    showBottomSheet(
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 15),
                        child: FutureBuilder(
                            future: Future.delayed(const Duration(seconds: 2)),
                            builder: (context, snapshot) {
                              print('cart size : $totalCartSize');

                              return ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                leading: const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  (totalCartSize == 1)
                                      ? 'You have $totalCartSize item in your cart'
                                      : 'You have $totalCartSize items in your cart',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: screenWidth! * 0.04,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                    child: Text(
                                      'Checkout',
                                      style:
                                          TextStyle(color: Colors.yellow[400]),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/order');
                                    }),
                              );
                            }),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '-',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.yellow[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${cartItems[dish]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.yellow[400],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    // cartItems[dish] = cartItems[dish]! + 1;

                    context.read<CartBloc>().add(AddToCartEvent(dish));
                    print('cart size : ${cartItems[dish]}');

                    print(state.cart);

                    showBottomSheet(
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 15),
                        child: FutureBuilder(
                            future: Future.delayed(const Duration(seconds: 2)),
                            builder: (context, snapshot) {
                              print('cart size : $totalCartSize');

                              return ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                leading: const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  (totalCartSize == 1)
                                      ? 'You have $totalCartSize item in your cart'
                                      : 'You have $totalCartSize items in your cart',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: screenWidth! * 0.04,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                    child: Text(
                                      'Checkout',
                                      style:
                                          TextStyle(color: Colors.yellow[400]),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/order');
                                    }),
                              );
                            }),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.yellow[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
