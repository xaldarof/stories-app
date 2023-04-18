class Story {
  final int id;
  final String body;
  final String timeCreate;
  final int categoryId;
  final int authorId;
  final String authorName;
  final String title;
  final int viewCount;
  final bool isPremium;
  final bool isEnabled;

  const Story({
    required this.id,
    required this.body,
    required this.timeCreate,
    required this.categoryId,
    required this.authorId,
    required this.authorName,
    required this.title,
    required this.isEnabled,
    required this.isPremium,
    required this.viewCount,
  });
}
