import 'package:flutter/cupertino.dart';

import 'package:qtim_test_app/data/source/source.dart';
import 'package:qtim_test_app/models/news.dart';

abstract class INewsRepository {
  @protected
  final INewsSource source;

  INewsRepository(this.source);

  Future<List<News>> getFeaturedNews();

  Future<List<News>> getNews();
}
