class RestaurantDetails {
  int? id;
  String? name;
  String? image;
  String? address;
  String? email;
  bool? status;

  RestaurantDetails(
      {this.id, this.name, this.image, this.address, this.email, this.status});

  RestaurantDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    address = json['address'];
    email = json['email'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['address'] = address;
    data['email'] = email;
    data['status'] = status;
    return data;
  }
}