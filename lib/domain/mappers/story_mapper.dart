import 'package:jokes_app/common/utils/date.dart';
import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/story_response.dart';
import 'package:jokes_app/domain/models/ui/story.dart';

import '../../data/database/app_database.dart';

class StoryResponseToUiMapper extends Mapper<StoryResponse, Story> {
  @override
  Story map(StoryResponse data) {
    return Story(
      id: data.id,
      body: data.body,
      timeCreate: data.timeCreate.toDate(),
      categoryId: data.categoryId,
      authorId: data.author.userid,
      authorName: data.author.username,
      title: data.title,
      viewCount: data.viewCount,
      isEnabled: !data.isFrozen,
      isPremium: data.isPremium,
      canModify: data.isOwner,
      isPublished: data.isPublished == true,
    );
  }
}

class StoryResponseToCacheMapper extends Mapper<StoryResponse, StoryCache> {
  @override
  StoryCache map(StoryResponse data) {
    return StoryCache(
      id: data.id,
      body: data.body,
      timeCreate: data.timeCreate.toDateTime(),
      categoryId: data.categoryId,
      authorId: data.author.userid,
      authorName: data.author.username,
      title: data.title,
      viewCount: data.viewCount,
      isPremium: data.isPremium,
      isFrozen: data.isFrozen,
      isOwner: data.isOwner,
      isPublished: data.isPublished == null ? true : false,
    );
  }
}

class StoryCacheToUiMapper extends Mapper<StoryCache, Story> {
  @override
  Story map(StoryCache data) {
    return Story(
      id: data.id,
      body: data.body,
      timeCreate: data.timeCreate.toDdMmHmMm(),
      categoryId: data.categoryId,
      authorId: data.authorId,
      authorName: data.authorName,
      title: data.title,
      viewCount: data.viewCount,
      isEnabled: !data.isFrozen,
      isPremium: data.isPremium,
      canModify: data.isOwner,
      isPublished: data.isPublished == true,
    );
  }
}
