import 'package:arna_web_service/arna_web_service.dart';

/// Tools to work with HTTP response.
class ResponseUtils {
  /// Get status code of response.
  StatusCode? getStatusCode(final Response? response) {
    if (response == null) {
      return null;
    }
    return StatusCode.getByCode(response.statusCode);
  }

  /// Get description of response's status code.
  String? getDescriptionOfResponse(final Response? response) {
    if (response == null) {
      return 'Response is null';
    }
    return StatusCode.getDescriptionByCode(response.statusCode);
  }

  /// Get body of response.
  dynamic getBody(final Response? response) {
    if (response == null) {
      return null;
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      return null;
    }
    return response.body;
  }

  /// Get body of a successful response.
  dynamic getSuccessfulBody(final Response? response) {
    if (response == null) {
      throw Exception('Response is null');
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      throw Exception('StatusCode is null');
    }
    if (!statusCode.isSuccess()) {
      throw MessageException(response.body);
    }
    return response.body;
  }

  /// Get UTF-8 body of response.
  dynamic getUTF8Body(final Response? response) {
    if (response == null) {
      return null;
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      return null;
    }
    return utf8.decode(response.bodyBytes);
  }

  /// Get UTF-8 body of a successful response.
  dynamic getSuccessfulUTF8Body(final Response? response) {
    if (response == null) {
      throw Exception('Response is null');
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      throw Exception('StatusCode is null');
    }
    if (!statusCode.isSuccess()) {
      throw MessageException(response.body);
    }
    return utf8.decode(response.bodyBytes);
  }
}
