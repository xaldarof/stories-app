extension StringExt on String {
  String cut(int count) {
    return length > count ? "${substring(0, count)}..." : this;
  }
}
