/// A custom exception with modified toString.
class MessageException implements Exception {
  /// Creates a MessageException.
  MessageException(this.message);

  /// A message describing the error.
  final String? message;

  @override
  String toString() {
    if (message == null) {
      return 'Exception';
    }
    return message!;
  }
}
