import 'package:flutter_test/flutter_test.dart';

import 'package:qtim_test_app/data/repository/news_repository.dart';
import 'package:qtim_test_app/data/source/news_source.dart';

void main() {
  group('Data repository test', () {
    late NewsRepository repo;

    setUp(() => repo = NewsRepository(MockNewsSource()));

    test('Get news', () async {
      final news = await repo.getNews();

      for (var n in news) {
        expect(n.id, isPositive);
        expect(n.title.length, isPositive);
        expect(n.content.length, isPositive);
      }
    });

    test('Get featured news', () async {
      final fNews = await repo.getFeaturedNews();

      for (var n in fNews) {
        expect(n.id, isPositive);
        expect(n.title.length, isPositive);
        expect(n.content.length, isPositive);
      }
    });

    test('Cache news', () async {
      final fNews = await repo.getFeaturedNews();
      final news = await repo.getNews();
      final othersFNews = await repo.getFeaturedNews();
      final othersNews = await repo.getNews();

      expect(fNews, othersFNews);
      expect(news, othersNews);
    });
  });
}
