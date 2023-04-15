class BaseResponse<T> {
  T data;

  BaseResponse(this.data);

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) build) {
    return BaseResponse(build(json['results']));
  }

  factory BaseResponse.fromJsonSingle(Map<String, dynamic> json) {
    return BaseResponse(json['results'] as T);
  }

  factory BaseResponse.fromJsonStringData(Map<String, dynamic> json) {
    return BaseResponse(json['results'] as T);
  }
}
