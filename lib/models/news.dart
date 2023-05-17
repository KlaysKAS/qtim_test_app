class News {
  final int id;
  final String title;
  final String content;
  final String? img;

  const News({
    required this.id,
    required this.title,
    required this.content,
    this.img,
  });
}
