abstract class DomainResult {}

class DomainSuccess<T> extends DomainResult {
  final T? data;

  DomainSuccess({
    this.data,
  });
}

class DomainFail<T> extends DomainResult {
  final T? data;

  DomainFail({
    this.data,
  });
}

class DomainLoading<T> extends DomainResult {
  final T? data;

  DomainLoading({
    this.data,
  });
}
