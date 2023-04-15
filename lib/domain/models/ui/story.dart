class Story {
  final int id;
  final String body;
  final String timeCreate;
  final int categoryId;
  final int authorId;
  final String authorName;

  const Story({
    required this.id,
    required this.body,
    required this.timeCreate,
    required this.categoryId,
    required this.authorId,
    required this.authorName,
  });
}
