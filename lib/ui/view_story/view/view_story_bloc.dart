import 'dart:async';

import 'package:bloc/bloc.dart';
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
    on<UnPublish>(_unpublish);
  }

  Future<void> _unpublish(UnPublish event, Emitter emitter) async {
    return emitter.forEach(
      _repository.unpublish(event.storyId),
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
}
