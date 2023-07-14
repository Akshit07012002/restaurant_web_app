part of 'menu_fetch_bloc.dart';

abstract class MenuFetchState {}

class MenuFetchInitial extends MenuFetchState {}

class MenuFetchStateLoading extends MenuFetchState {}

class MenuFetchStateSuccess extends MenuFetchState {
  final List<Categories> response;

  MenuFetchStateSuccess(this.response);
}

class MenuFetchStateFailure extends MenuFetchState {}

class MenuFetchStateRefresh extends MenuFetchState {}

class MenuFetchStateLoadMore extends MenuFetchState {}
