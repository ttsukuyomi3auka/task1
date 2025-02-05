import 'package:dio/dio.dart';
import 'package:task1/features/news/data/data.dart';

class NewsService {
  final Dio dio = Dio();
  Future<List<News>> fetchNews() async {
    final responses = await Future.wait([
      dio.get('https://exams2.masqed.ru/api1'),
      dio.get('https://exams2.masqed.ru/api2')
    ]);

    final List<News> newList = [];
    for (var response in responses) {
      newsList.addAll(News.fromApi(response.data));
    }
    newList.sort((a,b) => b.date.compareTo(a.date));
    return newList;
  }
}
