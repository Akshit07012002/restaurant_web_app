import 'package:flutter/material.dart';
import 'package:restaurant_web_app/utils/constants.dart';

class TitleCard extends StatefulWidget {
  const TitleCard({super.key});

  @override
  State<TitleCard> createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth! * 0.02),
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth! * 0.05),
                    child: Text(
                      'ManageResto',
                      style: TextStyle(
                        fontSize: screenWidth! * 0.06,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth! * 0.05),
                    child: Text(
                      'Somewhere',
                      style: TextStyle(
                        fontSize: screenWidth! * 0.045,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(screenWidth! * 0.05),
              child: Image.network(
                'https://res.cloudinary.com/dmxopx7ab/image/upload/v1681538136/Icon_gjxhhy.png',
                width: screenWidth! * 0.2,
                height: screenWidth! * 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
