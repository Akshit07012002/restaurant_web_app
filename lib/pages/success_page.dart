import 'package:flutter/material.dart';
import 'package:restaurant_web_app/utils/constants.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  final customer =
      "https://res.cloudinary.com/dqs8554a6/image/upload/v1681306382/istockphoto-1289068906-612x612_p0m1o4.jpg";
  final success =
      "https://res.cloudinary.com/dqs8554a6/image/upload/v1681301263/91001-success_mnfk4x.gif";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(screenHeight! * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                customer,
                height: 400,
                width: 400,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Image.network(
            success,
            height: 50,
            width: 50,
          ),
          Padding(
            padding:  EdgeInsets.all(screenHeight! * 0.03),
            child: Text(
              'Order Successful!',
              style: TextStyle(
                fontSize: screenWidth! * 0.05,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Text(
            'Thank you for ordering with us!',
            style: TextStyle(
              fontSize: screenWidth! * 0.045,
              fontFamily: 'Poppins',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenHeight! * 0.035),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.black,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: Text(
                'HOME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth! * 0.04,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
