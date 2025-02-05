import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/core/router/router.dart';
import 'package:task1/core/network/network.dart';
import 'package:task1/features/news/domain/domain.dart';


void main() {
  final newsService = NewsService();
  runApp(Task1(newsService));
}

class Task1 extends StatelessWidget {
  final NewsService newsService;
  const Task1(this.newsService, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(newsService)..loadNews(),
      child: MaterialApp.router(
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 47, 53, 49),
          scaffoldBackgroundColor: const Color.fromARGB(141, 56, 92, 66),
          textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        ),
        routerConfig: router,
        ),
      );
  }
}
