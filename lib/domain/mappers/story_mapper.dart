import 'package:jokes_app/common/utils/date.dart';
import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/story_response.dart';
import 'package:jokes_app/domain/models/ui/story.dart';

class StoryMapper extends Mapper<StoryResponse, Story> {
  @override
  Story map(StoryResponse data) {
    return Story(
      id: data.id,
      body: data.body,
      timeCreate: data.timeCreate.toDate(),
      categoryId: data.categoryId,
      authorId: data.author.userid,
      authorName: data.author.username,
    );
  }
}
