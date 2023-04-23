import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:jokes_app/common/extensions/controller_ext.dart';
import 'package:jokes_app/ui/profile/bloc/user_stories/user_stories_event.dart';
import 'package:jokes_app/ui/profile/bloc/user_stories/user_stories_state.dart';

import '../../../../domain/models/common/domain_result.dart';
import '../../../../domain/models/ui/category.dart';
import '../../../../domain/models/ui/story.dart';
import '../../../../domain/repositories/profile_repository.dart';

class UserStoriesBloc extends Bloc<UserStoriesEvent, UserStoriesState> {
  final ProfileRepository _repository;
  final ScrollController scrollController = ScrollController();

  int page = 1;
  bool endOfPaginationReached = false;

  UserStoriesBloc(
    this._repository,
  ) : super(const UserStoriesState()) {
    on<GetStories>(_getStories);
    on<GetCategories>(_getCategories);
    on<GetCategoryStories>(_getCategoryStories);
    on<SetUserId>(_setUserId);
    on<SetAsRead>(_setAsRead);
//
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
        page++;
        add(GetStories());
      }
    });
  }

  Future<void> _setAsRead(SetAsRead event, Emitter emitter) async {
    _repository.setAsRead(event.storyId);
  }

  Future<void> _getCategoryStories(
      GetCategoryStories event, Emitter emitter) async {
    page = 1;
    emitter(state.copyWith(stories: [], categoryId: event.categoryId));
    add(GetStories());
  }

  Future<void> _setUserId(SetUserId event, Emitter emitter) async {
    emitter(state.copyWith(userId: event.id));
  }

  Future<void> _getStories(GetStories event, Emitter emitter) {
    return emitter.forEach(
      _repository.getStories(state.userId ?? -1, state.categoryId, page),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(storiesStatus: UserStoriesStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(storiesStatus: UserStoriesStatus.fail);
        }
        if (data is DomainSuccess<List<Story>>) {
          endOfPaginationReached = ((data.data?.length ?? 0) < 10);
          return state.copyWith(
              storiesStatus: UserStoriesStatus.success,
              stories: (state.stories) + (data.data ?? []));
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
          return state.copyWith(categoryStatus: UserStoriesStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(categoryStatus: UserStoriesStatus.fail);
        }
        if (data is DomainSuccess<List<Category>>) {
          emitter(state.copyWith(categoryId: data.data?.first.id ?? 1));
          add(GetStories());
          return state.copyWith(
              categoryStatus: UserStoriesStatus.success, categories: data.data);
        }
        return state;
      },
    );
  }
}
