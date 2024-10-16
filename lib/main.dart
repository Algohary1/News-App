import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/home.dart';
import 'package:news_app/observer.dart';

void main(){
  void main() {
    Bloc.observer = MyBlocObserver();

  }
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: Home.routeName,
      routes:{
        Home.routeName: (context)=>  Home(),
      },
    );
  }
}
