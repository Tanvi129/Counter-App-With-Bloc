import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_state.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0)) {
    on<CounterIncrementPressed>((event, emit) => emit(CounterState(
        counterValue: state.counterValue + 1, wasIncremented: true)));

    on<CounterDecrementPressed>((event, emit) => emit(CounterState(
        counterValue: state.counterValue - 1, wasIncremented: false)));
  }
}

// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0) {
//     on<CounterIncrementPressed>((event, emit) => emit(state + 1));
//     on<CounterDecrementPressed>((event, emit) => emit(state - 1));
//   }
// }
