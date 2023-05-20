import 'package:flutter/material.dart';
import 'package:qtim_test_app/models/news.dart';
import 'package:qtim_test_app/ui/read_mark.dart';

class NewsWidget extends StatelessWidget {
  final News newsItem;

  const NewsWidget({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: newsItem.img != null
                    ? Image.network(
                        newsItem.img!,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(color: Colors.grey),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  newsItem.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ReadMark(id: newsItem.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
