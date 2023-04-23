part of 'view_story_bloc.dart';

@immutable
abstract class ViewStoryEvent {}

class ToggleVisibility extends ViewStoryEvent {
  final int storyId;
  final bool enabled;

  ToggleVisibility({
    required this.storyId,
    required this.enabled,
  });
}
