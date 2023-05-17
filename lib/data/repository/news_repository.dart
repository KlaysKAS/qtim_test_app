import 'package:qtim_test_app/data/repository/repository.dart';
import 'package:qtim_test_app/models/news.dart';

class NewsRepository extends INewsRepository {
  List<News> _newsStorage = [];
  List<News> _featuredNewsStorage = [];

  NewsRepository(super.source);

  @override
  Future<List<News>> getFeaturedNews() async {
    if (_featuredNewsStorage.isEmpty) {
      _featuredNewsStorage = await source.getFeaturedNews();
    }
    return _featuredNewsStorage;
  }

  @override
  Future<List<News>> getNews() async {
    if (_newsStorage.isEmpty) {
      _newsStorage = await source.getNews();
    }
    return _newsStorage;
  }
}
