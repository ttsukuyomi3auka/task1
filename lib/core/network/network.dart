import 'package:dio/dio.dart';

class NewsService {
  final Dio dio = Dio();

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      return response.data;
    } catch (e) {
      print('Ошибка в network: $e');
      return null;
    }
  }
}
