import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/story.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/ui/story_quote.dart';
import '../../../domain/repositories/story_quotes_repository.dart';

part 'story_quotes_event.dart';

part 'story_quotes_state.dart';

class StoryQuotesBloc extends Bloc<StoryQuotesEvent, StoryQuotesState> {
  final StoryQuotesRepository _repository;

  StoryQuotesBloc(
    this._repository,
  ) : super(const StoryQuotesState()) {
    on<GetQuotes>(_getQuotes);
  }

  Future<void> _getQuotes(GetQuotes event, Emitter emitter) async {
    return emitter.forEach(
      _repository.getQuotes(event.storyId),
      onData: (data) {
        printMessage("Status : ${data}");
        if (data is DomainLoading) {
          return state.copyWith(quotesStatus: StoryQuotesStatus.loading);
        }
        if (data is DomainSuccess<List<StoryQuote>>) {
          return state.copyWith(
              quotesStatus: StoryQuotesStatus.success, quotes: data.data);
        }
        if (data is DomainFail) {
          return state.copyWith(quotesStatus: StoryQuotesStatus.error);
        }
        return state;
      },
    );
  }
}
