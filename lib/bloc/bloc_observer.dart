import 'package:flutter_bloc/flutter_bloc.dart';

class RestoBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("Transition log: $transition");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print("Event log: $event");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("Change log $change");
    print("------------------------------");
  }
}
