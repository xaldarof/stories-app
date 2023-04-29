class StoryQuote {
  final String timeCreate;
  final String body;
  final String username;
  final int userId;
  final bool isOwner;

  const StoryQuote({
    required this.timeCreate,
    required this.body,
    required this.username,
    required this.userId,
    required this.isOwner,
  });
}
