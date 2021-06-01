import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/models/task_model.dart';
import 'package:untitled1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:untitled1/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled1/modules/new_tasks/new_tasks_screen.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget
{


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();


  TextEditingController titleController = TextEditingController();
  TextEditingController  dateController = TextEditingController();
  TextEditingController  timeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..createDatabase(),
      child: BlocConsumer<TodoCubit,AppStates>(
        builder: (context, state) {
          TodoCubit cubit = TodoCubit.getInstance(context);
          return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
                cubit.titles[cubit.currentIndex]
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.sort_by_alpha)
                ,
                onPressed: () {
                  cubit.sortData(cubit.currentIndex);
              },),
            ],
            brightness: Brightness.dark,
          ),
          body: cubit.screens[cubit.currentIndex] ,
          floatingActionButton: FloatingActionButton(
            child: Icon(
              cubit.floatActionIcon,
            ),

            onPressed: (){
              if(cubit.isBottomSheet)
              {
                if(formKey.currentState.validate())
                {
                  TaskModel taskModel = TaskModel(taskTitle: titleController.text, taskDate: dateController.text, taskTime: timeController.text);
                  cubit.insertToDatabase(taskModel);
                   titleController.text = '';
                    dateController.text = '';
                    timeController.text = '';


                }
              }
              else {
                scaffoldKey.currentState.showBottomSheet((context) =>
                    Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(15),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTextFormField(
                                hintText: 'Task Title',
                                functionValidator:(String value)
                                {
                                  if(value.isEmpty) {
                                    return 'required';
                                    return null;
                                  }
                                },
                                controller: titleController,
                                inputType: TextInputType.text,
                                prefixIcon: Icons.title,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              defaultTextFormField(
                                hintText: 'Task Date',
                                functionValidator:(String value)
                                {
                                  if(value.isEmpty) {
                                    return 'required';
                                    return null;
                                  }
                                },
                                controller: dateController,
                                inputType: TextInputType.text,
                                prefixIcon: Icons.date_range,
                                onTap: (){
                                  showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:DateTime.now() ,
                                    lastDate: DateTime.parse('2021-06-15'),
                                  ).then((value) {

                                      dateController.text = DateFormat.yMMMMd().format(value);


                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              defaultTextFormField(
                                hintText: 'Task Time',
                                functionValidator:(String value)
                                {
                                  if(value.isEmpty) {
                                    return 'required';
                                    return null;
                                  }
                                },
                                controller:  timeController,
                                inputType: TextInputType.text,
                                prefixIcon: Icons.watch_later_outlined,
                                onTap: (){
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()
                                  ).then((value)  {
                                    timeController.text = value.format(context).toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )).closed.then((value) {
                  cubit.changeFabIcon(Icons.edit,false);
                });
                cubit.changeFabIcon(Icons.add,true);
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeCurrentIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived'),
            ],
          ),
        );
        },
        listener: (context, state) {
             if(state is InsertDataBaseState)
               {
                 Navigator.pop(context);
               }
        },
      ),
    );
  }

  Future<String> getName() async {
    return 'Abdo Ali';
  }


}


