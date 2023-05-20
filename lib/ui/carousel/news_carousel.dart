import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/state/featured_vm/news_bloc.dart';
import 'package:qtim_test_app/state/featured_vm/news_events.dart';
import 'package:qtim_test_app/state/featured_vm/states/featured_news_state.dart';
import 'package:qtim_test_app/ui/carousel/news_paged_card.dart';
import 'package:qtim_test_app/ui/single_news_page.dart';

class NewsCarousel extends StatefulWidget {
  const NewsCarousel({super.key});

  @override
  State<NewsCarousel> createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  final _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedNewsBloc, FeaturedNewsState>(
        builder: (context, state) {
      return state.when(
        loading: () {
          return const CircularProgressIndicator();
        },
        error: (msg) {
          return Column(
            children: [
              Text(
                msg,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.redAccent),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () =>
                      context.read<FeaturedNewsBloc>().add(LoadFeaturedNews()),
                  child: const Text('Попробовать ещё')),
            ],
          );
        },
        success: (news) {
          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SingleNewsPage(
                      news: news[index],
                    ),
                  ),
                ),
                child: NewsPagedCard(
                  controller: _pageController,
                  newsInfo: news[index],
                  index: index,
                ),
              );
            },
            itemCount: news.length,
          );
        },
      );
    });
  }
}
