import 'package:qtim_test_app/models/news.dart';

abstract class INewsSource {
  Future<List<News>> getFeaturedNews();

  Future<List<News>> getNews();
}
