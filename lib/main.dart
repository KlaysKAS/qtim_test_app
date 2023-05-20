import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/locator.dart';
import 'package:qtim_test_app/state/featured_vm/news_bloc.dart';
import 'package:qtim_test_app/state/featured_vm/news_events.dart';
import 'package:qtim_test_app/state/news_vm/news_bloc.dart';
import 'package:qtim_test_app/state/news_vm/news_events.dart';
import 'package:qtim_test_app/state/read_vm/read_bloc.dart';
import 'package:qtim_test_app/ui/news_page.dart';

void main() {
  Locator.instance().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app for QTIM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FeaturedNewsBloc(Locator.instance().newsRepo)
              ..add(LoadFeaturedNews()),
          ),
          BlocProvider(
            create: (_) =>
                NewsBloc(Locator.instance().newsRepo)..add(LoadNews()),
          ),
          BlocProvider(create: (_) => ReadBloc()),
        ],
        child: const NewsPage(),
      ),
    );
  }
}
