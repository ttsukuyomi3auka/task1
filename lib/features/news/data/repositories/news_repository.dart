import 'dart:convert';
import 'package:task1/features/news/data/data.dart';
import 'package:task1/features/news/data/models/news_model.dart';

import 'package:task1/core/core.dart';
import 'package:task1/features/features.dart';

class NewsRepository {
  final NewsService newsService;

  NewsRepository(this.newsService);

   Future<List<News>> fetchNews() async {
    final responses = await Future.wait([
      newsService.get('https://exams2.masqed.ru/api1'),
      newsService.get('https://exams2.masqed.ru/api2')
    ]);

    final List<News> newsList = [];
    try {
      for (var response in responses) {
        print('Response data: $response');

        if (response is List) {
          newsList.addAll(News.fromApi(response));
        } else if (response is Map) {
          var data = response['data'];
          if (data != null && data is List) {
            newsList.addAll(News.fromApi(data));
          } else {
            print('not a List: $data');
          }
        } else {
          print('Hz wtf is that: $response');
        }
      }

      newsList.sort((a, b) {
        if (a.hot && !b.hot) return -1;
        if (!a.hot && b.hot) return 1;
        return b.date.compareTo(a.date);
      });

      return newsList;
    } catch (e) {
      print('Error fetching news: $e');
      return []; 
    }
  }
}
