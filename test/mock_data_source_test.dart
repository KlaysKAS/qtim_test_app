import 'package:flutter_test/flutter_test.dart';

import 'package:qtim_test_app/data/source/news_source.dart';

void main() {
  group('Mock data source test', () {
    late MockNewsSource generator;

    setUp(() => generator = MockNewsSource());

    test('Get news', () async {
      final news = await generator.getNews();

      for (var n in news) {
        expect(n.id, isPositive);
        expect(n.title.length, isPositive);
        expect(n.content.length, isPositive);
      }
    });

    test('Get featured news', () async {
      final fNews = await generator.getFeaturedNews();

      for (var n in fNews) {
        expect(n.id, isPositive);
        expect(n.title.length, isPositive);
        expect(n.content.length, isPositive);
      }
    });

    test('Id checks', () async {
      final fNews = await generator.getFeaturedNews();
      final news = await generator.getNews();
      final ids = <int>{};

      for (var n in fNews) {
        expect(ids.contains(n.id), false);
        ids.add(n.id);
      }

      for (var n in news) {
        expect(ids.contains(n.id), false);
        ids.add(n.id);
      }
    });
  });
}
