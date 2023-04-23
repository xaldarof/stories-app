part of 'view_story_bloc.dart';

enum ViewStoryStatus {
  success,
  fail,
  loading,
}

class ViewStoryState {
  final ViewStoryStatus? unpublishStatus;

  const ViewStoryState({
    this.unpublishStatus,
  });

  ViewStoryState copyWith({
    ViewStoryStatus? unpublishStatus,
  }) {
    return ViewStoryState(
      unpublishStatus: unpublishStatus ?? this.unpublishStatus,
    );
  }
}
