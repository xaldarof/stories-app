class UserNotification {
  final int id;
  final String content;
  final bool isRead;
  final String timeCreate;

  const UserNotification({
    required this.id,
    required this.content,
    required this.isRead,
    required this.timeCreate,
  });
}
