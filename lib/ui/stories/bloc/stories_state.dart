part of 'stories_bloc.dart';

enum StoriesStatus { success, fail, loading }

class StoriesState extends Equatable {
  final StoriesStatus? storiesStatus;
  final List<Story>? stories;
  final StoriesStatus? categoryStatus;
  final List<Category>? categories;

  @override
  List<Object?> get props => [
        storiesStatus,
        categoryStatus,
      ];

  const StoriesState({
    this.storiesStatus,
    this.stories,
    this.categories,
    this.categoryStatus,
  });

  StoriesState copyWith({
    StoriesStatus? storiesStatus,
    List<Story>? stories,
    StoriesStatus? categoryStatus,
    List<Category>? categories,
  }) {
    return StoriesState(
      storiesStatus: storiesStatus ?? this.storiesStatus,
      stories: stories ?? this.stories,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      categories: categories ?? this.categories,
    );
  }
}
