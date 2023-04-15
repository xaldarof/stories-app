import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/category.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/ui/story.dart';
import '../../../domain/repositories/stories_repository.dart';

part 'stories_event.dart';

part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  final StoriesRepository _repository;

  StoriesBloc(this._repository) : super(const StoriesState()) {
    on<GetStories>(_getStories);
    on<GetCategories>(_getCategories);
  }

  Future<void> _getStories(GetStories event, Emitter emitter) {
    return emitter.forEach(
      _repository.getStories(),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(storiesStatus: StoriesStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(storiesStatus: StoriesStatus.fail);
        }
        if (data is DomainSuccess<List<Story>>) {
          return state.copyWith(
              storiesStatus: StoriesStatus.success, stories: data.data);
        }
        return state;
      },
    );
  }

  Future<void> _getCategories(GetCategories event, Emitter emitter) {
    return emitter.forEach(
      _repository.getCategories(),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(categoryStatus: StoriesStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(categoryStatus: StoriesStatus.fail);
        }
        if (data is DomainSuccess<List<Category>>) {
          return state.copyWith(
              categoryStatus: StoriesStatus.success, categories: data.data);
        }
        return state;
      },
    );
  }
}
