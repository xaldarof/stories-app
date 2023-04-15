part of 'stories_bloc.dart';

@immutable
abstract class StoriesEvent {}

class GetStories extends StoriesEvent {}

class GetCategories extends StoriesEvent {}
