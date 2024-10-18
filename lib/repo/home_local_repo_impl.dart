import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeLocalRepoImpl implements HomeRepo{
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourceResponse> getSources(String id) {
    // TODO: implement getSources
    throw UnimplementedError();
  }



}



