part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final Dishes dish;

  const AddToCartEvent(this.dish);

  @override
  List<Object> get props => [dish];

  @override
  String toString() => 'AddToCartEvent { dish: $dish }';
}

class RemoveFromCartEvent extends CartEvent {
  final Dishes dish;

  const RemoveFromCartEvent(this.dish);

  @override
  List<Object> get props => [dish];

  @override
  String toString() => 'RemoveFromCartEvent { dish: $dish }';
} 

class ClearCartEvent extends CartEvent {
  final List<Dishes> cart;

  const ClearCartEvent(this.cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'ClearCartEvent { cart: $cart }';
}

