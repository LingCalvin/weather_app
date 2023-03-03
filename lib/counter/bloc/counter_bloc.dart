import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrementPressed>(
      (event, emit) => emit(CounterState(count: state.count + 1)),
    );
  }
}
