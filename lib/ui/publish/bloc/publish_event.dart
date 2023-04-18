part of 'publish_bloc.dart';

@immutable
abstract class PublishEvent {}

class PublishStory extends PublishEvent {
  final int categoryId;

  PublishStory({
    required this.categoryId,
  });
}

class GetCategories extends PublishEvent {}
