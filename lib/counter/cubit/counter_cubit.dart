import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/counter/cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(InitialState());
  int counter = 1;
  void counterPlus()
  {
    counter++;
    emit(PlusState());
  }

  void counterMinus()
  {
    counter--;
    emit(MinusState());
  }
  static CounterCubit getInstance(context)=>BlocProvider.of(context);

}