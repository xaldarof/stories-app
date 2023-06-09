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

class SendReport extends ViewStoryEvent {
  final int storyId;

  SendReport({
    required this.storyId,
  });
}

class CreateQuote extends ViewStoryEvent {
  final int storyId;
  final String body;

  CreateQuote({
    required this.storyId,
    required this.body,
  });
}
