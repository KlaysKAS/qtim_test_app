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
          img:
              'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
          title: faker.lorem.word(),
          content: faker.lorem.sentences(10).join('. '),
        ),
      );
      ++_idCount;
    }
    return news;
  }
}
