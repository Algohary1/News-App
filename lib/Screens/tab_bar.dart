import 'package:flutter/material.dart';
import 'package:news_app/Screens/news_item.dart';
import 'package:news_app/Screens/tab_item.dart';
import 'package:news_app/api/Api_Manager.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
          return Column(
            children: [
              DefaultTabController(
                  length: sources.length,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TabBar(
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        onTap: (value) {
                          selectedTabIndex = value;
                          setState(() {});
                        },
                        tabs: sources
                            .map((e) => TabItem(
                                source: e,
                                isSelected:
                                    sources.elementAt(selectedTabIndex) == e))
                            .toList()),
                  )),
              FutureBuilder(
                future:
                    ApiManager.getNewsData(sources[selectedTabIndex].id ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text("SomeThing went wrong");
                  }
                  var articles = snapshot.data?.articles ?? [];
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) {
                        return NewsItem(articles: articles[index]);
                      },
                      itemCount: articles.length,
                    ),
                  );
                },
              )
            ],
          );
        });
  }
}
