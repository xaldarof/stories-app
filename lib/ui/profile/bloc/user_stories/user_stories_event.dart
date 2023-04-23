abstract class UserStoriesEvent {}

class GetStories extends UserStoriesEvent {}

class GetCategoryStories extends UserStoriesEvent {
  final int? categoryId;
  final int userId;

  GetCategoryStories({
    this.categoryId,
    required this.userId,
  });
}

class GetCategories extends UserStoriesEvent {}

class SetAsRead extends UserStoriesEvent {
  final int storyId;

  SetAsRead({
    required this.storyId,
  });
}

class SetUserId extends UserStoriesEvent {
  final int id;

  SetUserId({
    required this.id,
  });
}
