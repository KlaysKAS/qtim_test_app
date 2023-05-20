import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/state/featured_vm/news_bloc.dart';
import 'package:qtim_test_app/state/news_vm/news_bloc.dart';
import 'package:qtim_test_app/state/read_vm/read_bloc.dart';
import 'package:qtim_test_app/state/read_vm/read_events.dart';
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
          actions: [
            IconButton(
              onPressed: () {
                final id1 = context.read<FeaturedNewsBloc>().state.whenOrNull(
                        success: (n) {
                      return n.map((e) => e.id);
                    }) ??
                    [];
                final id2 =
                    context.read<NewsBloc>().state.whenOrNull(success: (n) {
                          return n.map((e) => e.id);
                        }) ??
                        [];
                context.read<ReadBloc>().add(ReadAllEvent([...id1, ...id2]));
              },
              icon: Icon(
                Icons.checklist,
                color: theme.colorScheme.onPrimary,
              ),
              color: theme.colorScheme.onPrimary,
            ),
          ],
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
