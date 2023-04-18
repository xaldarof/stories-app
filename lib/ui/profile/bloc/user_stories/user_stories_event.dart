
abstract class UserStoriesEvent {}

class GetStories extends UserStoriesEvent {}

class GetCategoryStories extends UserStoriesEvent {
  final int? categoryId;

  GetCategoryStories({
    this.categoryId,
  });
}

class GetCategories extends UserStoriesEvent {}
