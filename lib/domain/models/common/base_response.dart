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
class BaseListResponse {
  List<dynamic> data;

  BaseListResponse(this.data);

  factory BaseListResponse.fromJson(Map<String, dynamic> json) {
    return BaseListResponse((json['results'] as List<dynamic>));
  }

  factory BaseListResponse.fromJsonStringData(Map<String, dynamic> json) {
    return BaseListResponse(json['results'] as dynamic);
  }
}