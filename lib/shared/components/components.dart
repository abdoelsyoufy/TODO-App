import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color backgroundColor = Colors.blue,
  @required Function function,
  @required String name,
  bool isUpperCase = true,
}) {
  return Container(
    width: width,
    color: backgroundColor,
    padding: EdgeInsets.all(5),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ? name.toUpperCase() : name,
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    ),
  );
}

Widget defaultTextFormField({
  @required String  hintText ,
  IconData prefixIcon,
  IconData  suffixIcon,
  bool isPassword = false,
  @required Function functionValidator,
  @required TextEditingController  controller,
  @required  TextInputType inputType,
  Function  suffixClick,
  Function  onTap,
})
{

  return  TextFormField(
    keyboardType: inputType,
    controller: controller,
    obscureText: isPassword,
    validator: functionValidator,
    onTap: onTap,
    decoration: InputDecoration(
      labelText: hintText,
      border: OutlineInputBorder(),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: suffixClick,
      ),

    ),



  );
}


Widget buildTaskItem({
  Map<String, dynamic> task ,
  BuildContext context ,
  bool showDoneIcon = true,
  bool showArchivedIcon = true,

}){

  String title = task['title'];
  String date = task['date'];
  String time = task['time'];
  int id = task['id'];
  return Dismissible(
    key: Key(id.toString()),
    child: Padding(

      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent[500],
            child: Text(
              '$time',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            radius: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,

                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$date',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    if(showDoneIcon )  IconButton(
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        if(task['status'] == 'done') {
                          TodoCubit.getInstance(context).updateDatabase(
                              status: 'new',
                              id: task['id']
                          );
                        }
                        else  {
                          TodoCubit.getInstance(context).updateDatabase(
                              status: 'done',
                              id: task['id']
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if(showArchivedIcon)   IconButton(
                      icon: Icon(
                        Icons.archive,
                        color: Colors.grey[900],
                      ),
                      onPressed: () {
                        if(task['status'] == 'archived') {
                          TodoCubit.getInstance(context).updateDatabase(
                              status: 'new',
                              id: task['id']
                          );
                        }
                        else  {
                          TodoCubit.getInstance(context).updateDatabase(
                              status: 'archived',
                              id: task['id']
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),




        ],
      ),
    ),
    onDismissed: (direction) {
     TodoCubit.getInstance(context).deleteDatabase(id: id);
    },
  );
}

Widget buildTaskBuilder({List<Map> tasks})=> ConditionalBuilder(
  condition: tasks.length>0,
  builder: (context) => ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => buildTaskItem(task: tasks[index],context: context),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 20
        ),
        child: Container(
          color: Colors.grey[300],
          height: 1,
          width: double.infinity,
        ),
      ),
      itemCount:tasks.length),
  fallback:(context) =>  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            Icons.menu,
          color: Colors.grey,
          size: 110,
        ),
        Text(
          'Not Found any tasks , Plz add any tasks',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
        ),
      ],
    ),
  ),
);
