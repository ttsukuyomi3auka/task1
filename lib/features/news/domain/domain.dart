import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/core/network/network.dart';
import 'package:task1/features/news/data/models/news_model.dart';

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
  final NewsService service;

  NewsCubit(this.service) : super(NewsInitial());

  Future<void> loadNews() async {
    emit(NewsLoading());
    try {
      final news = await service.fetchNews();
      emit(NewsLoaded(news));
    } catch (e) {
      rethrow;
    }
  }
}
