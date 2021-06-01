import 'package:flutter/cupertino.dart';

class TaskModel
{
   String taskTitle;
   String taskDate;
   String taskTime;
  TaskModel({
     @required this.taskTitle,
    @required this.taskDate,
    @required this.taskTime
});
  String getTitle()
  {
    return taskTitle;
  }

   String getDate()
   {
     return taskDate;
   }

   String getTime()
   {
     return taskTime;
   }
}