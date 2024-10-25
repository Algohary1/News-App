import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/Screens/news_item.dart';
import 'package:news_app/Screens/tab_item.dart';
import 'package:news_app/api/Api_Manager.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/main.dart';
import 'package:news_app/repo/home_local_repo_impl.dart';
import 'package:news_app/repo/home_remote_repo_impl.dart';

class TabBarWidget extends StatelessWidget {
  String id;

  TabBarWidget({required this.id, super.key});


  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => HomeCubit(!hasInternet?  HomeRemoteRepoImpl(): HomeLocalRepoImpl())..getSources(id),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is HomeGetSourcesLoadingState||state is HomeGetNewsDataLoadingState){
              context.loaderOverlay.show();
            }else{

              context.loaderOverlay.hide();
            }

            if(state is ChangeSourceState){
              HomeCubit.get(context).getSources(id);

            }

          },
          builder: (context, state) {
            if (state is HomeGetSourcesSuccessState ||
                state is HomeGetNewsDataSuccessState) {
              return Column(children: [
                DefaultTabController(
                    length: HomeCubit.get(context)
                            .sourceResponse
                            ?.sources
                            ?.length ??
                        0,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TabBar(
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          isScrollable: true,
                          onTap: (value) {
                            HomeCubit.get(context).changeSources(value);
                          },
                          tabs: HomeCubit.get(context)
                              .sourceResponse!
                              .sources!
                              .map((e) => TabItem(
                                    source: e,
                                    isSelected: HomeCubit.get(context)
                                            .sourceResponse!
                                            .sources!
                                            .elementAt(HomeCubit.get(context).selectedSourceIndex) ==
                                        e,
                                  ))
                              .toList()),
                    )),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      return NewsItem(
                          articles: HomeCubit.get(context)
                              .newsDataResponse!
                              .articles![index]);
                    },
                    itemCount: HomeCubit.get(context)
                            .newsDataResponse
                            ?.articles
                            ?.length ??
                        0,
                  ),
                ),
              ]);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
    // return FutureBuilder(
    //     future: ApiManager.getSources(widget.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (snapshot.hasError) {
    //         return const Text("SomeThing went wrong");
    //       }
    //       var sources = snapshot.data?.sources ?? [];
    //       return Column(
    //         children: [
    //           DefaultTabController(
    //               length: sources.length,
    //               child: Padding(
    //                 padding: EdgeInsets.all(8),
    //                 child: TabBar(
    //                     indicatorColor: Colors.transparent,
    //                     dividerColor: Colors.transparent,
    //                     isScrollable: true,
    //                     onTap: (value) {
    //                       selectedTabIndex = value;
    //                       setState(() {});
    //                     },
    //                     tabs: sources
    //                         .map((e) => TabItem(
    //                             source: e,
    //                             isSelected:
    //                                 sources.elementAt(selectedTabIndex) == e))
    //                         .toList()),
    //               )),
    //           FutureBuilder(
    //             future:
    //                 ApiManager.getNewsData(sources[selectedTabIndex].id ?? ''),
    //             builder: (context, snapshot) {
    //               if (snapshot.connectionState == ConnectionState.waiting) {
    //                 return const Center(
    //                   child: CircularProgressIndicator(),
    //                 );
    //               }
    //               if (snapshot.hasError) {
    //                 return const Text("SomeThing went wrong");
    //               }
    //               var articles = snapshot.data?.articles ?? [];
    //               return Expanded(
    //                 child: ListView.separated(
    //                   separatorBuilder: (context, index) => SizedBox(
    //                     height: 15,
    //                   ),
    //                   itemBuilder: (context, index) {
    //                     return NewsItem(articles: articles[index]);
    //                   },
    //                   itemCount: articles.length,
    //                 ),
    //               );
    //             },
    //           )
    //         ],
    //       );
    //     });
  }
}
