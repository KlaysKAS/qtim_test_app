import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/data/repository/news_repository.dart';
import 'package:qtim_test_app/state/news_vm/news_events.dart';
import 'package:qtim_test_app/state/news_vm/states/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _repository;

  NewsBloc(this._repository) : super(const NewsState.loading()) {
    on<LoadNews>(_loadNews);
  }

  Future<void> _loadNews(LoadNews event, Emitter<NewsState> emit) async {
    emit(const NewsState.loading());
    try {
      final news = await _repository.getNews();
      emit(NewsState.success(news));
    } catch (e, s) {
      emit(NewsState.error('Что-то пошло не так'));
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
