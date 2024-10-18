import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/SourceResponse.dart';

abstract class HomeStates{}

class HomeInitState extends HomeStates{}

class HomeGetSourcesLoadingState extends HomeStates{}

class HomeGetSourcesErrorState extends HomeStates{

  String error;
  HomeGetSourcesErrorState(this.error);
}

class HomeGetSourcesSuccessState extends HomeStates{
  SourceResponse sourceResponse;

  HomeGetSourcesSuccessState(this.sourceResponse);
}

class HomeGetNewsDataLoadingState extends HomeStates{}

class HomeGetNewsDataErrorState extends HomeStates{

  String error;
  HomeGetNewsDataErrorState(this.error);

}

class HomeGetNewsDataSuccessState extends HomeStates{

  NewsDataResponse newsDataResponse;

  HomeGetNewsDataSuccessState(this.newsDataResponse);
}

class ChangeSourceState extends HomeStates{


}