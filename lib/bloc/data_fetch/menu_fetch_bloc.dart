import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/data_model.dart';
import 'package:restaurant_web_app/models/response_model.dart';
import 'package:restaurant_web_app/repositories/menu_fetch.dart';

part 'menu_fetch_event.dart';
part 'menu_fetch_state.dart';

class MenuFetchBloc extends Bloc<MenuFetchEvent, MenuFetchState> {
  MenuFetchRepository menuFetchRepository = MenuFetchRepository();

  MenuFetchBloc() : super(MenuFetchInitial()) {
    on<MenuFetchEvent>((event, emit) async {
      if (event is MenuFetchStarted) {
        emit(MenuFetchStateLoading());
        try {
          List<Categories> menu = await menuFetchRepository.fetchOnboardingData();
          emit(MenuFetchStateSuccess(menu));
        } catch (e) {
          emit(MenuFetchStateFailure());
        }
      }
    });
  }

}
