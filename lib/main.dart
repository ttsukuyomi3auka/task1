import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/core/network/network.dart';
import 'package:task1/features/news/data/data.dart';
import 'package:task1/features/news/domain/domain.dart';
import 'package:task1/features/screens/news_screen.dart';

void main() {
  final newsService = NewsService();
  final newsRepository = NewsRepository(newsService);

  runApp(Task1(newsRepository));
}

class Task1 extends StatelessWidget {
  final NewsRepository newsRepository;
  const Task1(this.newsRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(newsRepository)..loadNews(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 47, 53, 49),
          secondaryHeaderColor: const Color.fromARGB(210, 46, 49, 47),
          scaffoldBackgroundColor: const Color.fromARGB(131, 56, 92, 66),
          textTheme: TextTheme(
              bodyLarge:
                  TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
        ),
        home: NewsScreen(),
      ),
    );
  }
}
