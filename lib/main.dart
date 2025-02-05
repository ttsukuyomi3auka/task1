import 'package:flutter/material.dart';
import 'package:task1/core/network/network.dart';
import 'package:task1/features/screens/news_screen.dart';

void main() {
  final newsService = NewsService();
  runApp(News(newsService));
}

class News extends StatelessWidget {
  final NewsService newsService;
  News(this.newsService);

  @override
  Widget build(BuildContext context) {
    return NewsScreen();
  }
}