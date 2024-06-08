abstract class BusinessException implements Exception {
  final String? message;
  final String code;
  BusinessException(this.code, this.message);
}
