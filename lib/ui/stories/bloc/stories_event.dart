part of 'stories_bloc.dart';

@immutable
abstract class StoriesEvent {}

class GetStories extends StoriesEvent {
  final int? categoryId;

  GetStories({
    this.categoryId,
  });
}

class GetCategoryStories extends StoriesEvent {
  final int? categoryId;

  GetCategoryStories({
    this.categoryId,
  });
}

class GetCategories extends StoriesEvent {}
