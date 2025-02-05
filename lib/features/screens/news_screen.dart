import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/features/news/domain/domain.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewCubit, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is NewsLoaded) {
        return ListView.builder(
          itemCount: state.news.length,
          itemBuilder: (context, index) {
            final news = state.news[index];
            return ListTile(
              title: Text(news.title),
              subtitle: Text(
                news.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: news.isPopular ? Text('this news is popular') : null,
            );
          },
        );
      } else {
        return Center(
          child: Text('Downlod error'),
        );
      }
    });
  }
}
