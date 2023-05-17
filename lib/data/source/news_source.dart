import 'package:qtim_test_app/data/generator.dart';
import 'package:qtim_test_app/data/source/source.dart';
import 'package:qtim_test_app/models/news.dart';

class MockNewsSource extends INewsSource {
  final _generator = NewsGenerator();

  @override
  Future<List<News>> getFeaturedNews() async {
    return Future(() => _generator.genNNews(10));
  }

  @override
  Future<List<News>> getNews() async {
    return Future(() => _generator.genNNews(10));
  }
}
