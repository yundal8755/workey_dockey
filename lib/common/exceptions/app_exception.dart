/// 앱에서 발생하는 모든 에러의 기본 클래스
sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

/// Network
class NetworkDisconnectedException extends AppException {
  NetworkDisconnectedException() : super('network-disconnected', '인터넷 연결을 확인해주세요');
}
