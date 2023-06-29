// ignore_for_file: overridden_fields, annotate_overrides

part of 'cart_bloc.dart';

abstract class CartState {
  final Map<Dishes, int> cart;
  final int totalCartSize;
  const CartState(this.cart, this.totalCartSize);

  @override
  List<Object> get props => [cart];
}

class CartInitial extends CartState {
  CartInitial(Map<Dishes, int> cart) : super(cart, 0);
}

class CartStateSuccess extends CartState {
  final Map<Dishes, int> cart;
  final int totalCartSize;

  CartStateSuccess(this.cart, this.totalCartSize) : super(cart, totalCartSize);
}

class CartStateFailure extends CartState {
  final Map<Dishes, int> cart;
  final int totalCartSize;

  CartStateFailure(this.cart, this.totalCartSize) : super(cart, totalCartSize);
}

class CartStateLoading extends CartState {
  final Map<Dishes, int> cart;
  final int totalCartSize;

  CartStateLoading(this.cart, this.totalCartSize) : super(cart, totalCartSize);
}

class AddToCart extends CartState {
  final Map<Dishes, int> cart;
  final int totalCartSize;

  AddToCart(this.cart, this.totalCartSize) : super(cart, totalCartSize);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'AddToCart { cart: $cart }';
}

class RemoveFromCart extends CartState {
  final Map<Dishes, int> cart;
  final int totalCartSize;

  RemoveFromCart(this.cart, this.totalCartSize) : super(cart, totalCartSize);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'RemoveFromCart { cart: $cart }';
}

class ClearCart extends CartState {
  final Map<Dishes, int> cart;
  final int totalCartSize;

  ClearCart(this.cart, this.totalCartSize) : super(cart, totalCartSize);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'ClearCart { cart: $cart }';
}


// class CartInitial extends CartState {
//   CartInitial() : super([]);
// }

// class CartStateLoading extends CartState {
//   CartStateLoading() : super([]);
// }

// class CartStateSuccess extends CartState {
//   final List<Dishes> response;

//   CartStateSuccess(this.response) : super(response);
// }

// class CartStateFailure extends CartState {
//   CartStateFailure() : super([]);
// }


// class AddToCart extends CartState {
//   final List<Dishes> cart;

//   const AddToCart(this.cart) : super(cart);

//   @override
//   List<Object> get props => [cart];

//   @override
//   String toString() => 'AddToCart { cart: $cart }';

// }

// class RemoveFromCart extends CartState {
//   final List<Dishes> cart;

//   const RemoveFromCart(this.cart) : super(cart);

//   @override
//   List<Object> get props => [cart];

//   @override
//   String toString() => 'RemoveFromCart { cart: $cart }';

// }

// class ClearCart extends CartState {
//   final List<Dishes> cart;

//   const ClearCart(this.cart) : super(cart);

//   @override
//   List<Object> get props => [cart];

//   @override
//   String toString() => 'ClearCart { cart: $cart }';

// }


