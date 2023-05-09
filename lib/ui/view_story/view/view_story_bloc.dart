import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/view_story_repository.dart';

part 'view_story_event.dart';

part 'view_story_state.dart';

class ViewStoryBloc extends Bloc<ViewStoryEvent, ViewStoryState> {
  final ViewStoryRepository _repository;

  ViewStoryBloc(
    this._repository,
  ) : super(const ViewStoryState()) {
    on<ToggleVisibility>(_unpublish);
    on<CreateQuote>(_createQuote);
    on<SendReport>(_sendReport);
  }

  Future<void> _sendReport(SendReport event, Emitter emitter) async {
    emitter(state.copyWith(sendReportStatus: ViewStoryStatus.loading));
    final res = await _repository.sendReport(event.storyId);
    if (res) {
      emitter(state.copyWith(sendReportStatus: ViewStoryStatus.success));
    } else {
      emitter(state.copyWith(sendReportStatus: ViewStoryStatus.fail));
    }
  }

  Future<void> _unpublish(ToggleVisibility event, Emitter emitter) async {
    return emitter.forEach(
      _repository.unpublish(event.storyId, event.enabled),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(unpublishStatus: ViewStoryStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(unpublishStatus: ViewStoryStatus.fail);
        }
        if (data is DomainSuccess) {
          return state.copyWith(unpublishStatus: ViewStoryStatus.success);
        }
        return state;
      },
    );
  }

  Future<void> _createQuote(CreateQuote event, Emitter emitter) async {
    return emitter.forEach(
      _repository.createQuote(event.storyId, event.body),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(quoteCreateStatus: ViewStoryStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(quoteCreateStatus: ViewStoryStatus.fail);
        }
        if (data is DomainSuccess) {
          return state.copyWith(quoteCreateStatus: ViewStoryStatus.success);
        }
        return state;
      },
    );
  }
}
