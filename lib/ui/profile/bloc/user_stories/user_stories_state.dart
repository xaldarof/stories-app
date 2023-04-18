import 'package:equatable/equatable.dart';
import 'package:jokes_app/domain/models/ui/story.dart';

import '../../../../domain/models/ui/category.dart';

enum UserStoriesStatus {
  loading,
  success,
  fail,
}

class UserStoriesState extends Equatable {
  final UserStoriesStatus? storiesStatus;
  final List<Story> stories;
  final UserStoriesStatus? categoryStatus;
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

  const UserStoriesState({
    this.storiesStatus,
    this.stories = const [],
    this.categoryStatus,
    this.categories = const [],
    this.showCategories = true,
    this.categoryId,
  });

  UserStoriesState copyWith({
    UserStoriesStatus? storiesStatus,
    List<Story>? stories,
    UserStoriesStatus? categoryStatus,
    List<Category>? categories,
    bool? showCategories,
    int? categoryId,
  }) {
    return UserStoriesState(
      storiesStatus: storiesStatus ?? this.storiesStatus,
      stories: stories ?? this.stories,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      categories: categories ?? this.categories,
      showCategories: showCategories ?? this.showCategories,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}
