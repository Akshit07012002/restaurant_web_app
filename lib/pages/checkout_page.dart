import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_web_app/models/dish_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';
import 'package:restaurant_web_app/widgets/custom_dialog.dart';

import '../bloc/cart/cart_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      Map<Dishes, int> cartItems = state.cart;
      int totalCartSize = state.totalCartSize;
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Text(
            'Table No : ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'ITEMS(S) ADDED',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: screenHeight! * 0.5,
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  '${cartItems.keys.elementAt(index).dishName}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                trailing: Text(
                  '${cartItems.values.elementAt(index)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            
            onPressed: () {
             
             showCustomDialog(context);

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const SuccessPage(),
              //   ),
              // );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text('Place Order'),
          ),
        ],
      ));
    });
  }

  
}
