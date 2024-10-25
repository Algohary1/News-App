import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/Screens/home.dart';
import 'package:news_app/observer.dart';

        bool hasInternet=false;

void main(){


  void main() {

    final listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
  switch (status) {
    case InternetStatus.connected:
      // The internet is now connected
      hasInternet=true;
    case InternetStatus.disconnected:
      // The internet is now disconnected
      hasInternet=false;
  }
});
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
