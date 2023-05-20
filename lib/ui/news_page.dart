import 'package:flutter/material.dart';
import 'package:qtim_test_app/ui/carousel/news_carousel.dart';
import 'package:qtim_test_app/ui/list/news_list.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          backgroundColor: theme.colorScheme.primary,
        ),
        body: const Column(
          children: [
            ListTile(
              title: Text('Featured News'),
            ),
            SizedBox(
              height: 200,
              child: NewsCarousel(),
            ),
            ListTile(title: Text('News')),
            Expanded(child: NewsList()),
          ],
        ));
  }
}
