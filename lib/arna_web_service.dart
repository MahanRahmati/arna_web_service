// Arna Web Service is a simple and powerful HTTP package for Flutter.
library arna_web_service;

import 'dart:convert' show jsonEncode;

import 'package:arna_logger/arna_logger.dart';
import 'package:http/http.dart' show Client, Response;

export 'package:http/http.dart';

/// The class that takes care of HTTP client and connections across multiple
/// requests to the server.
class ArnaWebService {
  ArnaWebService._();

  /// Creates an ArnaWebService.
  factory ArnaWebService.service() => _arnaWebService;

  static final ArnaWebService _arnaWebService = ArnaWebService._();
  final Client _client = Client();

  Map<String, String> _updateHeaders({
    required final Map<String, String>? headers,
    required final String serverKey,
    required final String? token,
  }) {
    final Map<String, String> finalHeaders = headers ?? <String, String>{};
    if (token != null) {
      finalHeaders.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    return finalHeaders;
  }

  /// Sends an HTTP HEAD request with the given headers to the given URL.
  Future<Response?> head(
    final Uri url, {
    final Map<String, String>? headers,
    final String serverKey = 'Authorization',
    final String? token,
  }) async {
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      serverKey: serverKey,
      token: token,
    );
    arnaJsonLogger(title: 'Head - Headers', data: finalHeaders);
    try {
      return await _client.head(url, headers: finalHeaders);
    } catch (e) {
      arnaLogger(title: 'Head - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP GET request with the given headers to the given URL.
  Future<Response?> get(
    final Uri url, {
    final Map<String, String>? headers,
    final String serverKey = 'Authorization',
    final String? token,
  }) async {
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      serverKey: serverKey,
      token: token,
    );
    arnaJsonLogger(title: 'Get - Headers', data: finalHeaders);
    try {
      return await _client.get(url, headers: finalHeaders);
    } catch (e) {
      arnaLogger(title: 'Get - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP POST request with the given headers and body to the given
  /// URL.
  Future<Response?> post(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String serverKey = 'Authorization',
    final String? token,
  }) async {
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      serverKey: serverKey,
      token: token,
    );
    arnaJsonLogger(title: 'Post - Headers', data: finalHeaders);
    if (body != null) {
      arnaJsonLogger(title: 'Post - Body', data: body);
    }
    try {
      return await _client.post(
        url,
        headers: finalHeaders,
        body: body == null ? null : jsonEncode(body),
      );
    } catch (e) {
      arnaLogger(title: 'Post - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP PUT request with the given headers and body to the given
  /// URL.
  Future<Response?> put(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String serverKey = 'Authorization',
    final String? token,
  }) async {
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      serverKey: serverKey,
      token: token,
    );
    arnaJsonLogger(title: 'Put - Headers', data: finalHeaders);
    if (body != null) {
      arnaJsonLogger(title: 'Post - Body', data: body);
    }
    try {
      return await _client.put(
        url,
        headers: finalHeaders,
        body: body == null ? null : jsonEncode(body),
      );
    } catch (e) {
      arnaLogger(title: 'Put - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP PATCH request with the given headers and body to the given
  /// URL.
  Future<Response?> patch(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String serverKey = 'Authorization',
    final String? token,
  }) async {
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      serverKey: serverKey,
      token: token,
    );
    arnaJsonLogger(title: 'Patch - Headers', data: finalHeaders);
    if (body != null) {
      arnaJsonLogger(title: 'Patch - Body', data: body);
    }
    try {
      return await _client.patch(
        url,
        headers: finalHeaders,
        body: body == null ? null : jsonEncode(body),
      );
    } catch (e) {
      arnaLogger(title: 'Patch - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP DELETE request with the given headers to the given URL.
  Future<Response?> delete(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String serverKey = 'Authorization',
    final String? token,
  }) async {
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      serverKey: serverKey,
      token: token,
    );
    arnaJsonLogger(title: 'Delete - Headers', data: finalHeaders);
    if (body != null) {
      arnaJsonLogger(title: 'Delete - Body', data: body);
    }
    try {
      return await _client.delete(
        url,
        headers: finalHeaders,
        body: body == null ? null : jsonEncode(body),
      );
    } catch (e) {
      arnaLogger(title: 'Delete - Error', data: e);
      return null;
    }
  }
}
