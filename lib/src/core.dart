import 'dart:async' show TimeoutException;
import 'dart:convert' show jsonEncode;

import 'package:arna_logger/arna_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' show Client, Response;

/// The class that takes care of HTTP client and connections across multiple
/// requests to the server.
class ArnaWebService {
  ArnaWebService._();

  /// Creates an ArnaWebService.
  factory ArnaWebService.service() => _arnaWebService;

  static final ArnaWebService _arnaWebService = ArnaWebService._();
  final Client _client = Client();

  Future<bool> _checkConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  Map<String, String> _updateHeaders({
    required final Map<String, String>? headers,
    required final String? token,
  }) {
    final Map<String, String> finalHeaders = headers ?? <String, String>{};
    if (token != null) {
      finalHeaders.addAll(<String, String>{'Authorization': 'Bearer $token'});
    }
    return finalHeaders;
  }

  void _logger(
    final bool useLogger, {
    final String? title,
    final dynamic data,
  }) {
    if (useLogger) {
      arnaLogger(title: title, data: data);
    }
  }

  /// Sends an HTTP HEAD request with the given headers to the given URL.
  Future<Response?> head(
    final Uri url, {
    final Map<String, String>? headers,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
  }) async {
    final bool isConnected = await _checkConnectivity();
    if (!isConnected) {
      _logger(useLogger, data: 'Device not connected to any network');
      onConnectionError?.call();
      return null;
    }
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Head - Headers', data: finalHeaders);
    try {
      return await _client
          .head(url, headers: finalHeaders)
          .timeout(timeoutDuration);
    } on TimeoutException catch (e) {
      _logger(useLogger, title: 'Head - Timeout', data: e);
      onTimeout?.call();
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Head - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP GET request with the given headers to the given URL.
  Future<Response?> get(
    final Uri url, {
    final Map<String, String>? headers,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
  }) async {
    final bool isConnected = await _checkConnectivity();
    if (!isConnected) {
      _logger(useLogger, data: 'Device not connected to any network');
      onConnectionError?.call();
      return null;
    }
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Get - Headers', data: finalHeaders);
    try {
      return await _client
          .get(url, headers: finalHeaders)
          .timeout(timeoutDuration);
    } on TimeoutException catch (e) {
      _logger(useLogger, title: 'Get - Timeout', data: e);
      onTimeout?.call();
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Get - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP POST request with the given headers and body to the given
  /// URL.
  Future<Response?> post(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
  }) async {
    final bool isConnected = await _checkConnectivity();
    if (!isConnected) {
      _logger(useLogger, data: 'Device not connected to any network');
      onConnectionError?.call();
      return null;
    }
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Post - Headers', data: finalHeaders);
    if (body != null) {
      _logger(useLogger, title: 'Post - Body', data: body);
    }
    try {
      return await _client
          .post(
            url,
            headers: finalHeaders,
            body: body == null ? null : jsonEncode(body),
          )
          .timeout(timeoutDuration);
    } on TimeoutException catch (e) {
      _logger(useLogger, title: 'Post - Timeout', data: e);
      onTimeout?.call();
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Post - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP PUT request with the given headers and body to the given
  /// URL.
  Future<Response?> put(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
  }) async {
    final bool isConnected = await _checkConnectivity();
    if (!isConnected) {
      _logger(useLogger, data: 'Device not connected to any network');
      onConnectionError?.call();
      return null;
    }
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Put - Headers', data: finalHeaders);
    if (body != null) {
      _logger(useLogger, title: 'Post - Body', data: body);
    }
    try {
      return await _client
          .put(
            url,
            headers: finalHeaders,
            body: body == null ? null : jsonEncode(body),
          )
          .timeout(timeoutDuration);
    } on TimeoutException catch (e) {
      _logger(useLogger, title: 'Put - Timeout', data: e);
      onTimeout?.call();
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Put - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP PATCH request with the given headers and body to the given
  /// URL.
  Future<Response?> patch(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
  }) async {
    final bool isConnected = await _checkConnectivity();
    if (!isConnected) {
      _logger(useLogger, data: 'Device not connected to any network');
      onConnectionError?.call();
      return null;
    }
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Patch - Headers', data: finalHeaders);
    if (body != null) {
      _logger(useLogger, title: 'Patch - Body', data: body);
    }
    try {
      return await _client
          .patch(
            url,
            headers: finalHeaders,
            body: body == null ? null : jsonEncode(body),
          )
          .timeout(timeoutDuration);
    } on TimeoutException catch (e) {
      _logger(useLogger, title: 'Patch - Timeout', data: e);
      onTimeout?.call();
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Patch - Error', data: e);
      return null;
    }
  }

  /// Sends an HTTP DELETE request with the given headers to the given URL.
  Future<Response?> delete(
    final Uri url, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
  }) async {
    final bool isConnected = await _checkConnectivity();
    if (!isConnected) {
      _logger(useLogger, data: 'Device not connected to any network');
      onConnectionError?.call();
      return null;
    }
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Delete - Headers', data: finalHeaders);
    if (body != null) {
      _logger(useLogger, title: 'Delete - Body', data: body);
    }
    try {
      return await _client
          .delete(
            url,
            headers: finalHeaders,
            body: body == null ? null : jsonEncode(body),
          )
          .timeout(timeoutDuration);
    } on TimeoutException catch (e) {
      _logger(useLogger, title: 'Delete - Timeout', data: e);
      onTimeout?.call();
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Delete - Error', data: e);
      return null;
    }
  }
}
