import 'package:flutter/material.dart';
import 'package:news_app/Screens/home.dart';

void main(){

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
