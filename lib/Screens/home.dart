import 'package:flutter/material.dart';
import 'package:news_app/Screens/tab_item.dart';
import 'package:news_app/api/Api_Manager.dart';

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
              drawer: const Drawer(),
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
              body: FutureBuilder(
                future: ApiManager.getSources(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text("SomeThing went wrong");
                  }
                  var sources = snapshot.data?.sources ?? [];
                  return DefaultTabController(
                      length: sources.length,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TabBar(
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          isScrollable: true,
                          onTap: (value) {
                            selectedTabIndex=value;
                            setState(() {
                              
                            });
                          },
                            tabs: sources
                                .map((e) => TabItem(
                                      source: e,
                                      isSelected: sources.elementAt(selectedTabIndex)==e
                                    ))
                                .toList()),
                      ));
                },
              ),
            )));
  }
}