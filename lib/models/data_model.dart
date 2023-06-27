import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/topping_model.dart';

class Data {
  List<Categories>? categories;
  List<ToppingPush>? toppingPush;

  Data({this.categories, this.toppingPush});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['toppingPush'] != null) {
      toppingPush = <ToppingPush>[];
      json['toppingPush'].forEach((v) {
        toppingPush!.add(ToppingPush.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (toppingPush != null) {
      data['toppingPush'] = toppingPush!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
