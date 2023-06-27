class Dishes {
  int? id;
  String? dishName;
  int? price;

  Dishes({this.id, this.dishName, this.price});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dish_name'] = dishName;
    data['price'] = price;
    return data;
  }
}
