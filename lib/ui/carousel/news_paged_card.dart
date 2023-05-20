import 'package:flutter/material.dart';
import 'package:qtim_test_app/models/news.dart';

class NewsPagedCard extends StatefulWidget {
  final PageController controller;
  final News newsInfo;
  final int index;

  const NewsPagedCard({
    super.key,
    required this.controller,
    required this.newsInfo,
    required this.index,
  });

  @override
  State<NewsPagedCard> createState() => _NewsPagedCardState();
}

class _NewsPagedCardState extends State<NewsPagedCard> {
  final ValueNotifier<double> _scrollPosition = ValueNotifier<double>(0.0);

  void _onScrollPositionChanged() {
    setState(() => _scrollPosition.value = widget.controller.page ?? 0.0);
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScrollPositionChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_onScrollPositionChanged);
    _scrollPosition.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final widthCard = widget.controller.viewportFraction *
        widget.controller.viewportFraction *
        deviceWidth;
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: widthCard,
            child: widget.newsInfo.img != null
                ? Image.network(
                    widget.newsInfo.img!,
                    fit: BoxFit.scaleDown,
                  )
                : Container(color: Colors.grey),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
            animation: _scrollPosition,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: _getTextOpacity(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.newsInfo.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  double _getTextOpacity() {
    final scrollPosition = _scrollPosition.value;
    final currentPosition = scrollPosition.floor();
    final delta = scrollPosition - currentPosition;

    if (widget.index == currentPosition) return 1 - delta;

    if (currentPosition + 1 == widget.index) return delta;

    return 0;
  }
}
