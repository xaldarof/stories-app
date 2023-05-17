import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jokes_app/common/extensions/controller_ext.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/category.dart';

import '../../../domain/models/ui/story.dart';
import '../../../domain/repositories/stories_repository.dart';

part 'stories_event.dart';

part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  final StoriesRepository _repository;
  final ScrollController scrollController = ScrollController();

  int page = 1;
  bool endOfPaginationReached = false;

  StoriesBloc(this._repository) : super(const StoriesState()) {
    on<LoadStories>(_loadStories);
    on<GetStories>(_getStories);
    on<GetCategories>(_getCategories);
    on<GetCategoryStories>(_getCategoryStories);
    on<SetAsRead>(_setAsRead);

    add(GetStories());
    scrollController.addListener(() {
      if (state.showCategories == true) {
        emit(state.copyWith(showCategories: false));
      }
    });
    scrollController.onTopReached((onTop) {
      emit(state.copyWith(showCategories: onTop));
    });
    scrollController.onBottomReached(() {
      if (!endOfPaginationReached) {
        add(LoadStories());
        add(GetStories());
      }
    });
  }

  Future<void> _getCategoryStories(
      GetCategoryStories event, Emitter emitter) async {
    page = 1;
    emitter(state.copyWith(stories: [], categoryId: event.categoryId));
    add(LoadStories());
    add(GetStories());
  }

  Future<void> _setAsRead(SetAsRead event, Emitter emitter) async {
    _repository.setAsRead(event.storyId);
  }

  Future<void> _loadStories(LoadStories event, Emitter emitter) {
    return emitter.forEach(
      _repository.loadStories(state.categoryId ?? 0, page),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(storiesStatus: StoriesStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(storiesStatus: StoriesStatus.fail);
        }
        if (data is DomainSuccess<int>) {
          endOfPaginationReached = ((data.data ?? 0) < 10);
          page++;
          add(GetStories());
          return state.copyWith(storiesStatus: StoriesStatus.success);
        }
        return state;
      },
    );
  }

  Future<void> _getStories(GetStories event, Emitter emitter) {
    return emitter.forEach(
      _repository.getStories(state.categoryId ?? 0),
      onData: (data) {
        return state.copyWith(stories: data);
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
          emitter(state.copyWith(categoryId: data.data?.first.id ?? 1));
          add(LoadStories());
          return state.copyWith(
              categoryStatus: StoriesStatus.success, categories: data.data);
        }
        return state;
      },
    );
  }
}
