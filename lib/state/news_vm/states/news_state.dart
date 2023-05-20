import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qtim_test_app/models/news.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.loading() = Loading;
  factory NewsState.error(String msg) = Error;
  factory NewsState.success(List<News> newsRes) = Success;
}
