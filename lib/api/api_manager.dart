import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/SourceResponse.dart';
import 'package:news_app/models/NewsData.dart';

class ApiManager {


//https://newsapi.org/v2/top-headlines/sources?apiKey=24b1bb2c6923406684c8bad042d861e2


static Future <SourceResponse> getSources()async{
Uri url=Uri.https('newsapi.org','/v2/top-headlines/sources',{ 'apiKey':'24b1bb2c6923406684c8bad042d861e2'}
);
http.Response response = await http.get(url);
Map<String, dynamic>jsonFormat=jsonDecode(response.body);

SourceResponse sourceResponse=SourceResponse.fromJson(jsonFormat);
return sourceResponse;
 }

static Future<NewsDataResponse> getNewsData(String sourceId)async{

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=24b1bb2c6923406684c8bad042d861e2

Uri url = Uri.https('newsapi.org','/v2/everything',
{
  'apiKey':'24b1bb2c6923406684c8bad042d861e2',
  'sources':sourceId,
}
);
http.Response response = await http.get(url);

var jsonFormat=jsonDecode(response.body);

NewsDataResponse newsDataResponse=NewsDataResponse.fromJson(jsonFormat);
return newsDataResponse;
 }
}