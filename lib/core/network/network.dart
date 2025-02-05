import 'package:dio/dio.dart';
import 'package:task1/features/news/data/data.dart';
import 'package:task1/features/news/data/models/news_model.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<News>> fetchNews() async {
    final responses = await Future.wait([
      dio.get('https://exams2.masqed.ru/api1'),
      dio.get('https://exams2.masqed.ru/api2')
    ]);

    final List<News> newsList = [];
    try {
      for (var response in responses) {
        print('Response data: ${response.data}');

        if (response.data is List) {
          newsList.addAll(News.fromApi(response.data));
        } else if (response.data is Map) {
          var data = response.data['data'];
          if (data != null && data is List) {
            newsList.addAll(News.fromApi(data));
          } else {
            print('Expected a List in the "data" field but got: $data');
          }
        }
      }

      // Сортируем сначала по полю 'hot', затем по дате
      newsList.sort((a, b) {
        // Сначала новости с hot: true
        if (a.hot && !b.hot) return -1;
        if (!a.hot && b.hot) return 1;
        return b.date.compareTo(a.date);
      });

      return newsList;
    } catch (e) {
      // Обрабатываем возможные ошибки и возвращаем пустой список
      print('Error fetching news: $e');
      return []; // Возвращаем пустой список в случае ошибки
    }
  }
}
