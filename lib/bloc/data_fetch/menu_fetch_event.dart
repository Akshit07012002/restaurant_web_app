part of 'menu_fetch_bloc.dart';

abstract class MenuFetchEvent {}

class MenuFetchStarted extends MenuFetchEvent {}

class MenuFetchEventStarted extends MenuFetchEvent {}

class MenuFetchEventSuccess extends MenuFetchEvent {}

class MenuFetchEventFailure extends MenuFetchEvent {}

class MenuFetchEventRefresh extends MenuFetchEvent {}

class MenuFetchEventLoadMore extends MenuFetchEvent {}





