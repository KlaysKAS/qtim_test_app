import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/state/read_vm/read_bloc.dart';

class ReadMark extends StatelessWidget {
  const ReadMark({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: BlocSelector<ReadBloc, Map<int, bool>, bool>(
        selector: (state) => state[id] ?? false,
        builder: (context, isReaded) {
          return isReaded
              ? const Icon(Icons.drafts)
              : const Icon(Icons.fiber_new);
        },
      ),
    );
  }
}
