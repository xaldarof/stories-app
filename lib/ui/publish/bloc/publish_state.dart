part of 'publish_bloc.dart';

enum PublishStatus {
  loading,
  success,
  fail,
}

@immutable
class PublishState extends Equatable {
  final PublishStatus? publishStatus;

  @override
  List<Object?> get props => [
        publishStatus,
      ];

  const PublishState({
    this.publishStatus,
  });

  PublishState copyWith({
    PublishStatus? publishStatus,
  }) {
    return PublishState(
      publishStatus: publishStatus ?? this.publishStatus,
    );
  }
}
