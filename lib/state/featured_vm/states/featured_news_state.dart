import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qtim_test_app/models/news.dart';

part 'featured_news_state.freezed.dart';

@freezed
class FeaturedNewsState with _$FeaturedNewsState {
  const factory FeaturedNewsState.loading() = Loading;
  factory FeaturedNewsState.error(String msg) = Error;
  factory FeaturedNewsState.success(List<News> newsRes) = Success;
}
