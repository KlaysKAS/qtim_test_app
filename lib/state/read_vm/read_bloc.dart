import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtim_test_app/state/read_vm/read_events.dart';

class ReadBloc extends Bloc<ReadEvent, Map<int, bool>> {
  ReadBloc() : super({}) {
    on<ReadOneEvent>(_read);
    on<ReadAllEvent>(_readAll);
  }

  Future<void> _read(ReadOneEvent event, Emitter<Map<int, bool>> emit) async {
    final oldIds = state;
    final newIds = <int, bool>{};
    newIds.addAll(oldIds);
    newIds[event.id] = true;
    emit(newIds);
  }

  Future<void> _readAll(
    ReadAllEvent event,
    Emitter<Map<int, bool>> emit,
  ) async {
    final oldIds = state;
    final newIds = <int, bool>{};
    newIds.addAll(oldIds);
    newIds.addEntries(event.ids.map((e) => MapEntry(e, true)));

    emit(newIds);
  }
}
