import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/SourceResponse.dart';

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
}