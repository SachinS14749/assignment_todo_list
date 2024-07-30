import 'package:bloc/bloc.dart';

class GlobalBlocObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // Logg the event details here..
    print('Bloc onEvent() runtime type = ${bloc.runtimeType} && Event = $event');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('Bloc onCreated() runtime type = ${bloc.runtimeType}');
  }

@override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Bloc onTransition() runtime type = ${bloc.runtimeType} && Transition = $transition');
  }
  
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Bloc onError() runtime type = ${bloc.runtimeType} && Error = $error');
  }
  
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('Bloc onClose() runtime type = ${bloc.runtimeType}');
  }
}
