import 'package:flutter/material.dart';
import 'package:news_app/Screens/categories.dart';
import 'package:news_app/Screens/drawer_tab.dart';
import 'package:news_app/Screens/tab_bar.dart';
import 'package:news_app/Screens/tab_item.dart';
import 'package:news_app/api/Api_Manager.dart';
import 'package:news_app/models/categoryModel.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home';
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'))),
        child: DefaultTabController(
            length: 60,
            child: Scaffold(
              drawer: DrawerTab(onCLick: onDrawerClick,),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.white),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 25,
                      ))
                ],
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                backgroundColor: Colors.green,
                title: const Text(
                  'News App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              body: selectedCategory==null? CategoriesTab(onClick: onCategorySelect,): TabBarWidget(id: selectedCategory!.id,),
            )));
  }

  CategoryModel? selectedCategory=null;
onDrawerClick(id){
  if(id==DrawerTab.CATEGORY_ID) {
    selectedCategory = null;
    Navigator.pop(context);
  }else if(id==DrawerTab.SETTINGS_ID){

  }
  setState(() {

  });
}
  onCategorySelect(cat){

    selectedCategory = cat;
    setState(() {});

  }
}