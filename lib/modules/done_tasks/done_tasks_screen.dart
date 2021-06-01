import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/new_tasks/new_tasks_screen.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var tasks = TodoCubit.getInstance(context).allDoneTask;
        return buildTaskBuilder(tasks: tasks) ;
      },
    );
  }
}
