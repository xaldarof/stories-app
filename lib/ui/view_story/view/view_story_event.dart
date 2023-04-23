part of 'view_story_bloc.dart';

@immutable
abstract class ViewStoryEvent {}

class UnPublish extends ViewStoryEvent {
  final int storyId;

  UnPublish({
    required this.storyId,
  });
}
