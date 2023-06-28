part of 'cart_bloc.dart';

abstract class CartState {
  final List<Dishes> cart;
  const CartState(@required this.cart);

  @override
  List<Object> get props => [cart];
}

class CartInitial extends CartState {
  CartInitial() : super([]);
}

class CartStateLoading extends CartState {
  CartStateLoading() : super([]);
}

class CartStateSuccess extends CartState {
  final List<Dishes> response;

  CartStateSuccess(this.response) : super(response);
}

class CartStateFailure extends CartState {
  CartStateFailure() : super([]);
}


class AddToCart extends CartState {
  final List<Dishes> cart;

  const AddToCart(this.cart) : super(cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'AddToCart { cart: $cart }';

}

class RemoveFromCart extends CartState {
  final List<Dishes> cart;

  const RemoveFromCart(this.cart) : super(cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'RemoveFromCart { cart: $cart }';

}

class ClearCart extends CartState {
  final List<Dishes> cart;

  const ClearCart(this.cart) : super(cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'ClearCart { cart: $cart }';

}