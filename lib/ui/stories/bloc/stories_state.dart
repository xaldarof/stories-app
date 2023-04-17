part of 'stories_bloc.dart';

enum StoriesStatus { success, fail, loading }

class StoriesState extends Equatable {
  final StoriesStatus? storiesStatus;
  final List<Story> stories;
  final StoriesStatus? categoryStatus;
  final List<Category> categories;
  final bool showCategories;
  final int? categoryId;

  @override
  List<Object?> get props => [
        storiesStatus,
        categoryStatus,
        stories,
        categories,
        showCategories,
        categoryId
      ];

  const StoriesState({
    this.storiesStatus,
    this.stories = const [],
    this.categoryStatus,
    this.categories = const [],
    this.showCategories = true,
    this.categoryId,
  });

  StoriesState copyWith({
    StoriesStatus? storiesStatus,
    List<Story>? stories,
    StoriesStatus? categoryStatus,
    List<Category>? categories,
    bool? showCategories,
    int? categoryId,
  }) {
    return StoriesState(
      storiesStatus: storiesStatus ?? this.storiesStatus,
      stories: stories ?? this.stories,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      categories: categories ?? this.categories,
      showCategories: showCategories ?? this.showCategories,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}
