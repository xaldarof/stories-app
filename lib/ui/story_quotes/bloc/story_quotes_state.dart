part of 'story_quotes_bloc.dart';

enum StoryQuotesStatus {
  loading,
  success,
  error,
}

class StoryQuotesState extends Equatable {
  final StoryQuotesStatus? quotesStatus;
  final List<StoryQuote> quotes;

  @override
  List<Object?> get props => [
        quotesStatus,
        quotes,
      ];

  const StoryQuotesState({
    this.quotesStatus,
    this.quotes = const [],
  });

  StoryQuotesState copyWith({
    StoryQuotesStatus? quotesStatus,
    List<StoryQuote>? quotes,
  }) {
    return StoryQuotesState(
      quotesStatus: quotesStatus ?? this.quotesStatus,
      quotes: quotes ?? this.quotes,
    );
  }
}
