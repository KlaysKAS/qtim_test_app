class ReadEvent {}

class ReadOneEvent extends ReadEvent {
  final int id;
  ReadOneEvent(this.id);
}

class ReadAllEvent extends ReadEvent {
  final List<int> ids;
  ReadAllEvent(this.ids);
}
