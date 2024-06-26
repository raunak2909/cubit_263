import 'package:cubit_263/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState(count: 0)); //Initial state

  ///events
  void incrementCount(){
    int newValue = state.count + 1;
    emit(CounterState(count: newValue));
  }

  void decrementCount(){
    if(state.count>0){
      int newValue = state.count - 1;
      emit(CounterState(count: newValue));
    }
  }

}