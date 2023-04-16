import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
}
