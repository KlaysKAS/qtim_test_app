import 'package:faker/faker.dart';

import 'package:qtim_test_app/models/news.dart';

class NewsGenerator {
  int _idCount = 1;

  List<News> genNNews(int n) {
    final news = <News>[];
    for (int i = 0; i < n; ++i) {
      news.add(
        News(
          id: _idCount,
          title: faker.lorem.word(),
          content: faker.lorem.sentences(10).join('. '),
        ),
      );
      ++_idCount;
    }
    return news;
  }
}
