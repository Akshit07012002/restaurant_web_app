import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web_app/models/dish_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is CartStarted) {
        emit(CartInitial());
      } else if (event is AddToCartEvent) {
        cart.add(event.dish);
        emit(CartStateSuccess(cart));
      } else if (event is RemoveFromCartEvent) {
        cart.remove(event.dish);
        emit(CartStateSuccess(cart));
      } else if (event is ClearCartEvent) {
        cart.clear();
        emit(CartStateSuccess(cart));
      }
    });
  }

  final List<Dishes> cart = [];
  List<Dishes> get getCart => cart;

}
