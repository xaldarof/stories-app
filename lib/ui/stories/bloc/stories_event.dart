part of 'stories_bloc.dart';

@immutable
abstract class StoriesEvent {}

class GetStories extends StoriesEvent {}

class GetCategoryStories extends StoriesEvent {
  final int? categoryId;

  GetCategoryStories({
    this.categoryId,
  });
}

class GetCategories extends StoriesEvent {}

class SetAsRead extends StoriesEvent {
  final int storyId;

  SetAsRead({
    required this.storyId,
  });
}
