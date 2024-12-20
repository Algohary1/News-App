import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsData.dart';

class NewsItem extends StatelessWidget {

  Articles articles;

  NewsItem({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              height: 250,
              imageUrl: articles.urlToImage??'',
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
      // ClipRRect(
      //   borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
      //     child: Image.network(articles.urlToImage??'', height: 240,)),
      Text(articles.author ?? '', textAlign: TextAlign.start, style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),),
      Text(articles.title ?? '', style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,)),
      Text(articles.description ?? '', style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,)),
      Text(articles.publishedAt!.substring(0,10) ?? '',textAlign: TextAlign.end, style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,)),
        ],
      ),
    );
  }
}
