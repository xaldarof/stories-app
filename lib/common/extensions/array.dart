extension ListExt<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this?.isEmpty == true;
}
