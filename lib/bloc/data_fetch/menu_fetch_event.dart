part of 'menu_fetch_bloc.dart';

abstract class MenuFetchEvent {}

class MenuFetchStarted extends MenuFetchEvent {}

class MenuFetchEventStarted extends MenuFetchEvent {}

class MenuFetchEventSuccess extends MenuFetchEvent {}

class MenuFetchEventFailure extends MenuFetchEvent {}

class MenuFetchEventRefresh extends MenuFetchEvent {}

class MenuFetchEventLoadMore extends MenuFetchEvent {}

// class MenuFetchEventSearch extends MenuFetchEvent {
//   final String category;

//   MenuFetchEventSearch(this.category);
// }

// class MenuFetchEventSort extends MenuFetchEvent {
//   final String category;

//   MenuFetchEventSort(this.category);
// }

// class MenuFetchEventFilter extends MenuFetchEvent {
//   final String category;

//   MenuFetchEventFilter(this.category);
// }





