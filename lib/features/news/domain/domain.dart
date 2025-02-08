import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/features/news/data/models/news_model.dart';
import 'package:task1/features/news/data/repositories/news_repository.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;
  NewsLoaded(this.news);
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository repository;

  NewsCubit(this.repository) : super(NewsInitial());

  Future<void> loadNews() async {
    emit(NewsLoading());
    try {
      final news = await repository.fetchNews();
      emit(NewsLoaded(news));
    } catch (e) {
      rethrow;
    }
  }
}
