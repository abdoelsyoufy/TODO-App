import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/counter/counter_screen.dart';
import 'package:untitled1/layout/home_layout.dart';
import 'package:untitled1/modules/whatsapp/home_screen.dart';
import 'package:untitled1/modules/youtube/youtube_home_screen.dart';

import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeLayout(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   canvasColor: Colors.grey[900]
      // ),
    );
  }
}
