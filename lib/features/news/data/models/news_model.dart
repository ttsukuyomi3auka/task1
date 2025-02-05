// import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class News {
  final String title;
  final String description;
  final String date;
  final bool isPopular;
  News({
    required this.title,
    required this.description,
    required this.date,
    required this.isPopular,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      date: json['date'] ?? '',
      isPopular: json['isPopular'] ?? false,
    );
  }

  static List<News> fromApi(List<dynamic> data) {
    return data.map((json) => News.fromJson(json)).toList();
  }
}
