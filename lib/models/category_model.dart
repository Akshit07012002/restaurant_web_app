import 'package:restaurant_web_app/models/dish_model.dart';

class Categories {
  int? id;
  String? categoryName;
  List<Dishes>? dishes;

  Categories({this.id, this.categoryName, this.dishes});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(Dishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    if (dishes != null) {
      data['dishes'] = dishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
