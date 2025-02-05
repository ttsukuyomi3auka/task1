import 'package:dio/dio.dart';
import 'package:task1/features/news/data/data.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<News>> fetchNews() async {
    final responses = await Future.wait([
      dio.get('https://exams2.masqed.ru/api1'),
      dio.get('https://exams2.masqed.ru/api2')
    ]);

    final List<News> newsList = [];
    for (var response in responses) {
      final data = response.data; // data — это Map, а нам нужен List
      if (data is Map<String, dynamic> && data.containsKey('newsLine')) {
        final List<dynamic> newsData = data['newsLine'];
        newsList.addAll(News.fromApi(newsData));
      }
    }
    newsList.sort((a, b) => b.date.compareTo(a.date));
    return newsList;
  }
}
