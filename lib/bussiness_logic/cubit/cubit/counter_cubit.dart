import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState>   {
  CounterCubit() : super(CounterInitial());
  void increment() {
    emit(CounterUpdate(state.counter + 1));
  }

  void decrement() {
    emit(CounterUpdate(state.counter - 1));
  }
  
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterUpdate(json['counter'] as int);
  }
  
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return {
      'counter': state.counter,
    };

  }
}
