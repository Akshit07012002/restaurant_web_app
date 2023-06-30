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
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              'Checkout',
              style: TextStyle(
                  color: Colors.yellow[400],
                  fontSize: screenWidth! * 0.05,
                  fontWeight: FontWeight.w900),
            ),
            toolbarHeight: screenHeight! * 0.1,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Table ID :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth! * 0.05,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      tableId,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth! * 0.035,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  indent: screenWidth! * 0.1,
                  endIndent: screenWidth! * 0.1,
                  thickness: 2,
                  color: Colors.black,
                ),
                Text(
                  'Items(s) added',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                Divider(
                  indent: screenWidth! * 0.1,
                  endIndent: screenWidth! * 0.1,
                  thickness: 2,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: screenHeight! * 0.35,
                  width: screenWidth! * 0.8,
                  child: ScrollbarTheme(
                    data: ScrollbarThemeData(
                      thumbColor: MaterialStateProperty.all(Colors.yellow[400]),
                      trackColor: MaterialStateProperty.all(Colors.transparent),
                      crossAxisMargin: 10,
                      mainAxisMargin: 10,
                      minThumbLength: 20,
                      thickness: MaterialStateProperty.all(8),
                      radius: const Radius.circular(10),
                    ),
                    child: Scrollbar(
                      thickness: 8,
                      trackVisibility: true,
                      thumbVisibility: true,
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.fromLTRB(
                              screenWidth! * 0.15,
                              0,
                              screenWidth! * 0.15,
                              screenHeight! * 0.01),
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cartItems.isNotEmpty) showCustomDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (cartItems.isNotEmpty)? Colors.black: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth! * 0.3, screenHeight! * 0.08),
                  ),
                  child: const Text('Place Order'),
                ),
              ],
            ),
          ));
    });
  }
}
