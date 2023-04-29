import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/story_quote.dart';
import 'package:jokes_app/domain/repositories/story_quotes_repository.dart';

import '../../domain/data_sources/story_quotes_network_data_source.dart';
import '../../domain/mappers/story_quote_mapper.dart';

class StoryQuotesRepositoryImpl extends StoryQuotesRepository {
  final StoryQuotesNetworkDataSource _networkDataSource;
  final StoryQuoteMapper _storyQuoteMapper;

  @override
  Stream<DomainResult> createQuote(int storyId, String body) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.createQuote(storyId, body);
      if (res) {
        yield DomainSuccess();
      } else {
        yield DomainFail();
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> getQuotes(int storyId) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getQuotes(storyId);
      final ui = res.map((e) => _storyQuoteMapper.map(e));

      yield DomainSuccess<List<StoryQuote>>(data: ui.toList());
    } catch (e) {
      yield DomainFail();
    }
  }

  StoryQuotesRepositoryImpl({
    required StoryQuotesNetworkDataSource networkDataSource,
    required StoryQuoteMapper storyQuoteMapper,
  })  : _networkDataSource = networkDataSource,
        _storyQuoteMapper = storyQuoteMapper;
}
