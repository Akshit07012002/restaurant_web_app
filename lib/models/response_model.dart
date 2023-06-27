import 'package:restaurant_web_app/models/data_model.dart';
import 'package:restaurant_web_app/models/restaurant_model.dart';

class ResponseModel {
  String? status;
  String? message;
  RestaurantDetails? restaurantDetails;
  Data? data;

  ResponseModel({this.status, this.message, this.restaurantDetails, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    restaurantDetails = json['restaurantDetails'] != null
        ? RestaurantDetails.fromJson(json['restaurantDetails'])
        : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (restaurantDetails != null) {
      data['restaurantDetails'] = restaurantDetails!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
