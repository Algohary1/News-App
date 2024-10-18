import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/SourceResponse.dart';

abstract class HomeRepo{

 Future<SourceResponse> getSources(String id);

 Future<NewsDataResponse>  getNewsData(String sourceId);

}