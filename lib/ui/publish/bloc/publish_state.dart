part of 'publish_bloc.dart';

enum PublishStatus {
  loading,
  success,
  fail,
}

@immutable
class PublishState extends Equatable {
  final PublishStatus? publishStatus;
  final List<Category> categories;

  @override
  List<Object?> get props => [
        publishStatus,
        categories,
      ];

  const PublishState({
    this.publishStatus,
    this.categories = const [],
  });

  PublishState copyWith({
    PublishStatus? publishStatus,
    List<Category>? categories,
  }) {
    return PublishState(
      publishStatus: publishStatus ?? this.publishStatus,
      categories: categories ?? this.categories,
    );
  }
}
