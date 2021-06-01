import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/counter/cubit/counter_states.dart';
import 'package:untitled1/models/task_model.dart';
import 'package:untitled1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:untitled1/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled1/modules/new_tasks/new_tasks_screen.dart';
import 'package:untitled1/shared/cubit/states.dart';

class TodoCubit extends Cubit<AppStates>{
  TodoCubit() : super(InitialAppState());


  static TodoCubit getInstance(context)=>BlocProvider.of(context);

  int currentIndex = 0;
  Database database;
  List<Map<String,dynamic>> allRawTask = [];
  List<Map<String,dynamic>> allDoneTask = [];
  List<Map<String,dynamic>> allArchivedTask = [];
  bool isBottomSheet = false;


  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'Tasks',
    'Done',
    'Archived',
  ];
  void changeCurrentIndex(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  IconData floatActionIcon = Icons.edit;

  void changeFabIcon(IconData floatActionIcon, bool isShow)
  {
    this.floatActionIcon = floatActionIcon;
    this.isBottomSheet = isShow;
    emit(ChangeFabIconState());
  }

  void createDatabase()
  {
   openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version)  {
        print('Database created');
        db.execute('create table tasks (id integer  primary key , title text , date text , time text , status text default new)')
            .then((value) {
          print('Table is created');
        }).catchError((error){
          print('error when create db ${error.toString()}');
        });
      },

      onOpen: (db)  {
           getFromDatabase(db);
      },
    ).then((value)  {
      database = value;
      emit(CreateDataBaseState());
   });

  }
   insertToDatabase(TaskModel taskModel)
  {
    Map<String ,dynamic > data = {
      'title':taskModel.getTitle(),
      'date':taskModel.getDate(),
      'time':taskModel.getTime(),
    };
     database.insert('tasks',data).then((value) {
      print('$value insert is successfully');
      emit(InsertDataBaseState());

      getFromDatabase(database);

    }).catchError((error){
      print('error when insert to db ${error.toString()}');
    });
  }

   getFromDatabase(Database db)
  {
    allRawTask=[];
    allArchivedTask=[];
    allDoneTask=[];
      db.rawQuery('select * from tasks').then((value) {
        value.forEach((element) {
          if(element['status']=='new')
            {
              allRawTask.add(element);
            }
          else if(element['status']=='done')
            {
              allDoneTask.add(element);
            }
          else
            {
              allArchivedTask.add(element);
            }
          print('status ' + element['status']);

        });
        emit(GetDataBaseState());
      });
  }

  updateDatabase({String status , int id})
  {
    database.rawUpdate('update tasks set status = ? where id = ?',['$status',id]).then((value) {
      emit(UpdateDataBaseState());
      getFromDatabase(database);
    });
  }

  deleteDatabase({ int id})
  {
    database.rawUpdate('delete from tasks  where id = ?',[id]).then((value) {
      emit(DeleteDataBaseState());
      getFromDatabase(database);
    });
  }

 void sortData(int index)
 {
   switch(index)
   {
     case 0:
       if(allRawTask.length>0) {
         allRawTask.sort((m1, m2) {
           var r = m1["title"].compareTo(m2["title"]);
           if (r != 0) return r;
           return m1["title"].compareTo(m2["title"]);
         });
         emit(SortDataState()); } break;
     case 1:
       if(allDoneTask.length>0) {
         allDoneTask.sort((m1, m2) {
           var r = m1["title"].compareTo(m2["title"]);
           if (r != 0) return r;
           return m1["title"].compareTo(m2["title"]);
         });
         emit(SortDataState()); } break;
     case 2:
       if(allArchivedTask.length>0) {
         allArchivedTask.sort((m1, m2) {
           var r = m1["title"].compareTo(m2["title"]);
           if (r != 0) return r;
           return m1["title"].compareTo(m2["title"]);
         });
         emit(SortDataState());
       } break;
   }
 }

}