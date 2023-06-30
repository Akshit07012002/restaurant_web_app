import 'package:flutter/material.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/dish_model.dart';
import 'package:restaurant_web_app/utils/constants.dart';

void showMenuDialog(BuildContext context, List<Categories> categories,
    List<GlobalKey> categoryCardKeys, Map<Dishes, int> cartItems) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: screenHeight! * 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth! * 0.06,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: screenHeight! * 0.4,
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
                          // separatorBuilder: (context, index) => const Divider(
                          //       indent: 20,
                          //       endIndent: 20,
                          //       color: Colors.black54,
                          //     ),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Scrollable.ensureVisible(
                                    categoryCardKeys[index].currentContext!);

                                Navigator.pop(context);
                              },
                              contentPadding: EdgeInsets.fromLTRB(
                                  screenWidth! * 0.05, 0, screenWidth! * 0.15, 0),
                              title: Text(
                                '${categories[index].categoryName}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth! * 0.045,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              trailing: Text(
                                '${categories[index].dishes!.length}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth! * 0.04,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
