part of 'view_story_bloc.dart';

enum ViewStoryStatus {
  success,
  fail,
  loading,
}

class ViewStoryState {
  final ViewStoryStatus? unpublishStatus;
  final ViewStoryStatus? quoteCreateStatus;

  const ViewStoryState({
    this.unpublishStatus,
    this.quoteCreateStatus,
  });

  ViewStoryState copyWith({
    ViewStoryStatus? unpublishStatus,
    ViewStoryStatus? quoteCreateStatus,
  }) {
    return ViewStoryState(
      unpublishStatus: unpublishStatus ?? this.unpublishStatus,
      quoteCreateStatus: quoteCreateStatus ?? this.quoteCreateStatus,
    );
  }
}
