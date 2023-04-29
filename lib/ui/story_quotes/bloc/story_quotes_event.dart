part of 'story_quotes_bloc.dart';

@immutable
abstract class StoryQuotesEvent {}

class GetQuotes extends StoryQuotesEvent {
  final int storyId;

  GetQuotes({
    required this.storyId,
  });
}
