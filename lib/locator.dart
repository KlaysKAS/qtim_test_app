import 'package:qtim_test_app/data/repository/news_repository.dart';
import 'package:qtim_test_app/data/source/news_source.dart';

class Locator {
  static Locator? _instance;
  bool _inited = false;

  static Locator instance() {
    _instance ??= Locator._();
    return _instance!;
  }

  Locator._();

  late final NewsRepository newsRepo;

  init() async {
    await null;
    if (!_inited) {
      _inited = true;
      newsRepo = NewsRepository(MockNewsSource());
    }
  }
}
