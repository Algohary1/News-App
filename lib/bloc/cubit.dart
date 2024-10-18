import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
 HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitState());



  NewsDataResponse? newsDataResponse;
  SourceResponse? sourceResponse;
  int selectedSourceIndex=0;




 static HomeCubit get(context)=> BlocProvider.of(context);

 changeSources(int index)async {
   selectedSourceIndex=index;
   newsDataResponse=null;
   sourceResponse=null;
  await Future.delayed(Duration(milliseconds: 500));
   emit(ChangeSourceState());

 }

  Future<void> getSources(String id) async {
    emit(HomeGetSourcesLoadingState());
     try {

      SourceResponse sourceResponse= await repo.getSources(id);

      this.sourceResponse=sourceResponse;
      getNewsData(sourceResponse.sources![selectedSourceIndex].id!);

      emit(HomeGetSourcesSuccessState(sourceResponse));
    } catch (e) {
      emit(HomeGetSourcesErrorState('Something went wrong'));
    }
  }

  Future<void> getNewsData(String sourceId) async {

    try{
      emit(HomeGetNewsDataLoadingState());

     NewsDataResponse newsDataResponse=await repo.getNewsData(sourceId);


      this.newsDataResponse=newsDataResponse;

      emit(HomeGetNewsDataSuccessState(newsDataResponse));

    }catch(e){
      emit(HomeGetNewsDataErrorState('Something went wrong'));
    }
  }
}
