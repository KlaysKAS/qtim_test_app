import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/data/repository/news_repository.dart';
import 'package:qtim_test_app/state/featured_vm/news_events.dart';
import 'package:qtim_test_app/state/featured_vm/states/featured_news_state.dart';

class FeaturedNewsBloc extends Bloc<FeaturedNewsEvent, FeaturedNewsState> {
  final NewsRepository _repository;

  FeaturedNewsBloc(this._repository)
      : super(const FeaturedNewsState.loading()) {
    on<LoadFeaturedNews>(_loadNews);
  }

  Future<void> _loadNews(
      LoadFeaturedNews event, Emitter<FeaturedNewsState> emit) async {
    emit(const FeaturedNewsState.loading());
    try {
      final news = await _repository.getFeaturedNews();
      emit(FeaturedNewsState.success(news));
    } catch (e, s) {
      emit(FeaturedNewsState.error('Что-то пошло не так'));
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
