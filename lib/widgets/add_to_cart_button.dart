import 'package:flutter/material.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/dish_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';

ElevatedButton addToCartButton(BuildContext context, List<Dishes> cartItems, Dishes dish) => ElevatedButton(
      onPressed: () {
        if (cartItems.contains(dish)) {
          cartItems.remove(dish);
        } else {
          cartItems.add(dish);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          // vertical: MediaQuery.of(context).size.height * 0.02,
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