import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_web_app/models/dish_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial({})) {
    on<CartEvent>((event, emit) async {
      if (event is CartStarted) {
        emit(CartStateLoading({}, 0));
        try {
          Map<Dishes, int> cart = {};
          emit(CartStateSuccess(cart, 0));
        } catch (e) {
          emit(CartStateFailure({}, 0));
        }
      } else if (event is AddToCartEvent) {
        Map<Dishes, int> cart = state.cart;
        int totalCartSize = state.totalCartSize;

        totalCartSize = 0;

        print('bloc cart size : ${totalCartSize}');

        if (cart.containsKey(event.dish)) {
          print('previous: ${cart[event.dish]}');
          cart[event.dish] = cart[event.dish]! + 1;
          print('new: ${cart[event.dish]}');
        } else {
          cart[event.dish] = 1;
        }

        print('cart inside bloc : $cart');
        cart.forEach((key, value) {
          totalCartSize += value;
          print('total cart size inside: ${totalCartSize}');
        });
          // print('total cart size outside: ${totalCartSize}');

        emit(CartStateSuccess(cart, totalCartSize));
      } else if (event is RemoveFromCartEvent) {
        Map<Dishes, int> cart = state.cart;
        int totalCartSize = state.totalCartSize;

        totalCartSize = 0;

        print('bloc cart size : ${totalCartSize}');

        if (cart.containsKey(event.dish)) {
          if (cart[event.dish] == 1) {
            cart.remove(event.dish);
          } else {
            print('previous: ${cart[event.dish]}');
            cart[event.dish] = cart[event.dish]! - 1;
            print('new: ${cart[event.dish]}');
          }
        }

        print('cart inside bloc : $cart');
        cart.forEach((key, value) {
          totalCartSize += value;
          print('total cart size inside: ${totalCartSize}');
        });

        emit(CartStateSuccess(cart, totalCartSize));
      } else if (event is ClearCartEvent) {
        Map<Dishes, int> cart = {};
        emit(CartStateSuccess(cart, 0));
      }
    });
  }
}
