import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/state/news_vm/news_bloc.dart';
import 'package:qtim_test_app/state/news_vm/news_events.dart';
import 'package:qtim_test_app/state/news_vm/states/news_state.dart';
import 'package:qtim_test_app/state/read_vm/read_bloc.dart';
import 'package:qtim_test_app/state/read_vm/read_events.dart';
import 'package:qtim_test_app/ui/list/news_widget.dart';
import 'package:qtim_test_app/ui/single_news_page.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NewsBloc, NewsState>(
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
                      onPressed: () => context.read<NewsBloc>().add(LoadNews()),
                      child: const Text('Попробовать ещё')),
                ],
              );
            },
            success: (news) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context.read<ReadBloc>().add(
                            ReadOneEvent(news[index].id),
                          );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SingleNewsPage(
                          news: news[index],
                        ),
                      ));
                    },
                    child: NewsWidget(newsItem: news[index]),
                  );
                },
                itemCount: news.length,
              );
            },
          );
        },
      ),
    );
  }
}
