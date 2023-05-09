part of 'view_story_bloc.dart';

enum ViewStoryStatus {
  success,
  fail,
  loading,
}

class ViewStoryState extends Equatable {
  final ViewStoryStatus? unpublishStatus;
  final ViewStoryStatus? quoteCreateStatus;
  final ViewStoryStatus? sendReportStatus;

  const ViewStoryState({
    this.unpublishStatus,
    this.quoteCreateStatus,
    this.sendReportStatus,
  });

  ViewStoryState copyWith({
    ViewStoryStatus? unpublishStatus,
    ViewStoryStatus? quoteCreateStatus,
    ViewStoryStatus? sendReportStatus,
  }) {
    return ViewStoryState(
      unpublishStatus: unpublishStatus ?? this.unpublishStatus,
      quoteCreateStatus: quoteCreateStatus ?? this.quoteCreateStatus,
      sendReportStatus: sendReportStatus ?? this.sendReportStatus,
    );
  }

  @override
  List<Object?> get props => [
        unpublishStatus,
        quoteCreateStatus,
        sendReportStatus,
      ];
}
