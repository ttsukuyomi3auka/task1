// import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class News {
  final String date;
  final String title;
  final String description;
  final String author;
  final bool hot;
  News({
    required this.date,
    required this.title,
    required this.description,
    required this.author,
    required this.hot,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      date: json['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date']).toIso8601String()
          : '',
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      author: json['author'] ?? 'No Author',
      hot: json['hot'] ?? false,
    );
  }

  static List<News> fromApi(List<dynamic> data) {
    return data.map((json) => News.fromJson(json)).toList();
  }
}
