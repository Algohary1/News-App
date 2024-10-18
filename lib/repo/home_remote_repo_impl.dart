import 'dart:convert';

import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repo/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRemoteRepoImpl implements HomeRepo{
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https('newsapi.org', '/v2/everything', {
      'apiKey': '24b1bb2c6923406684c8bad042d861e2',
      'sources': sourceId,
    });
    http.Response response = await http.get(url);

    var jsonFormat = jsonDecode(response.body);

    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);

    return newsDataResponse;

  }

  @override
  Future<SourceResponse> getSources(String id) async {
    
    Uri url = Uri.https('newsapi.org', '/v2/top-headlines/sources',
      {'apiKey': '24b1bb2c6923406684c8bad042d861e2', 'category': id});
  http.Response response = await http.get(url);

  Map<String, dynamic> jsonFormat = jsonDecode(response.body);

  SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
  
  return sourceResponse;

  }



}