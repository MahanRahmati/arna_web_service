import 'package:dio/dio.dart';

import '/src/message_exception.dart';
import '/src/status_code.dart';

/// Tools to work with HTTP response.
class ResponseUtils {
  /// Get status code of response.
  StatusCode? getStatusCode(final Response<dynamic>? response) {
    if (response == null) {
      return null;
    }
    if (response.statusCode == null) {
      return null;
    }
    return StatusCode.getByCode(response.statusCode!);
  }

  /// Get description of response's status code.
  String? getDescriptionOfResponse(final Response<dynamic>? response) {
    if (response == null) {
      return 'Response is null';
    }
    if (response.statusCode == null) {
      return 'StatusCode is null';
    }
    return StatusCode.getDescriptionByCode(response.statusCode!);
  }

  /// Get body of response.
  dynamic getBody(final Response<dynamic>? response) {
    if (response == null) {
      return null;
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      return null;
    }
    return response.data;
  }

  /// Get body of a successful response.
  dynamic getSuccessfulBody(final Response<dynamic>? response) {
    if (response == null) {
      throw Exception('Response is null');
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      throw Exception('StatusCode is null');
    }
    if (!statusCode.isSuccess()) {
      throw MessageException(response.toString());
    }
    return response.data;
  }

  /// Get UTF-8 body of response.
  dynamic getUTF8Body(final Response<dynamic>? response) {
    if (response == null) {
      return null;
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      return null;
    }
    return response.data;
  }

  /// Get UTF-8 body of a successful response.
  dynamic getSuccessfulUTF8Body(final Response<dynamic>? response) {
    if (response == null) {
      throw Exception('Response is null');
    }
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      throw Exception('StatusCode is null');
    }
    if (!statusCode.isSuccess()) {
      throw MessageException(response.toString());
    }
    return response.data;
  }
}
