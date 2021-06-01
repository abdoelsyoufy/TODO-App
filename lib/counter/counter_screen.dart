import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/counter/cubit/counter_cubit.dart';
import 'package:untitled1/counter/cubit/counter_states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return     BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),

            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.getInstance(context).counterPlus();
                    },
                    child:Text(
                      'Plus',
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${CounterCubit.getInstance(context).counter}',

                    style: TextStyle(
                        fontSize: 35
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                       CounterCubit.getInstance(context).counterMinus();
                    },
                    child:Text(
                      'Minus',
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                  ),

                ],
              ),
            ),

          );
        },
        listener: (context, state){
          // if(state is MinusState) print('minus');
          // if(state is PlusState) print('plus');
        },
      ),
    );

  }
}
