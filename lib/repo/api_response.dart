
abstract class IApiResponse {
  IApiResponse(this.code, this.message);

  final int? code;
  final String? message;
}