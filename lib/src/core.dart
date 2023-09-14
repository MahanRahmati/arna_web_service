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
    Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    // Connectivity check
    if (checkConnectivity) {
      final bool isConnected = await _checkConnectivity();
      if (!isConnected) {
        _logger(useLogger, data: 'Device not connected to any network');
        onConnectionError?.call();
        return null;
      }
    }

    // Headers
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Head - Headers', data: finalHeaders);

    // QueryParameters
    if (queryParameters != null) {
      if (queryParameters is! Map<String, String?> ||
          queryParameters is! Map<String, Iterable<String>?>) {
        _logger(
          true,
          title: 'Head - QueryParameters',
          data:
              'QueryParameters must be Map<String, String?> or Map<String, Iterable<String>?>',
        );
        return null;
      }
      uri = uri.replace(queryParameters: queryParameters);
      _logger(
        useLogger,
        title: 'Head - QueryParameters',
        data: queryParameters,
      );
    }

    try {
      return await _client
          .head(uri, headers: finalHeaders)
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
    Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    // Connectivity check
    if (checkConnectivity) {
      final bool isConnected = await _checkConnectivity();
      if (!isConnected) {
        _logger(useLogger, data: 'Device not connected to any network');
        onConnectionError?.call();
        return null;
      }
    }

    // Headers
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Get - Headers', data: finalHeaders);

    // QueryParameters
    if (queryParameters != null) {
      if (queryParameters is! Map<String, String?> ||
          queryParameters is! Map<String, Iterable<String>?>) {
        _logger(
          true,
          title: 'Get - QueryParameters',
          data:
              'QueryParameters must be Map<String, String?> or Map<String, Iterable<String>?>',
        );
        return null;
      }
      uri = uri.replace(queryParameters: queryParameters);
      _logger(useLogger, title: 'Get - QueryParameters', data: queryParameters);
    }

    try {
      return await _client
          .get(uri, headers: finalHeaders)
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
    Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    // Connectivity check
    if (checkConnectivity) {
      final bool isConnected = await _checkConnectivity();
      if (!isConnected) {
        _logger(useLogger, data: 'Device not connected to any network');
        onConnectionError?.call();
        return null;
      }
    }

    // Headers
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Post - Headers', data: finalHeaders);

    // QueryParameters
    if (queryParameters != null) {
      if (queryParameters is! Map<String, String?> ||
          queryParameters is! Map<String, Iterable<String>?>) {
        _logger(
          true,
          title: 'Post - QueryParameters',
          data:
              'QueryParameters must be Map<String, String?> or Map<String, Iterable<String>?>',
        );
        return null;
      }
      uri = uri.replace(queryParameters: queryParameters);
      _logger(
        useLogger,
        title: 'Post - QueryParameters',
        data: queryParameters,
      );
    }

    // Body
    if (body != null) {
      _logger(useLogger, title: 'Post - Body', data: body);
    }

    try {
      return await _client
          .post(
            uri,
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
    Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    // Connectivity check
    if (checkConnectivity) {
      final bool isConnected = await _checkConnectivity();
      if (!isConnected) {
        _logger(useLogger, data: 'Device not connected to any network');
        onConnectionError?.call();
        return null;
      }
    }

    // Headers
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Put - Headers', data: finalHeaders);

    // QueryParameters
    if (queryParameters != null) {
      if (queryParameters is! Map<String, String?> ||
          queryParameters is! Map<String, Iterable<String>?>) {
        _logger(
          true,
          title: 'Put - QueryParameters',
          data:
              'QueryParameters must be Map<String, String?> or Map<String, Iterable<String>?>',
        );
        return null;
      }
      uri = uri.replace(queryParameters: queryParameters);
      _logger(useLogger, title: 'Put - QueryParameters', data: queryParameters);
    }

    // Body
    if (body != null) {
      _logger(useLogger, title: 'Put - Body', data: body);
    }
    try {
      return await _client
          .put(
            uri,
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
    Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    // Connectivity check
    if (checkConnectivity) {
      final bool isConnected = await _checkConnectivity();
      if (!isConnected) {
        _logger(useLogger, data: 'Device not connected to any network');
        onConnectionError?.call();
        return null;
      }
    }

    // Headers
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Patch - Headers', data: finalHeaders);

    // QueryParameters
    if (queryParameters != null) {
      if (queryParameters is! Map<String, String?> ||
          queryParameters is! Map<String, Iterable<String>?>) {
        _logger(
          true,
          title: 'Patch - QueryParameters',
          data:
              'QueryParameters must be Map<String, String?> or Map<String, Iterable<String>?>',
        );
        return null;
      }
      uri = uri.replace(queryParameters: queryParameters);
      _logger(
        useLogger,
        title: 'Patch - QueryParameters',
        data: queryParameters,
      );
    }

    // Body
    if (body != null) {
      _logger(useLogger, title: 'Patch - Body', data: body);
    }
    try {
      return await _client
          .patch(
            uri,
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
    Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    // Connectivity check
    if (checkConnectivity) {
      final bool isConnected = await _checkConnectivity();
      if (!isConnected) {
        _logger(useLogger, data: 'Device not connected to any network');
        onConnectionError?.call();
        return null;
      }
    }

    // Headers
    final Map<String, String> finalHeaders = _updateHeaders(
      headers: headers ?? <String, String>{},
      token: token,
    );
    _logger(useLogger, title: 'Delete - Headers', data: finalHeaders);

    // QueryParameters
    if (queryParameters != null) {
      if (queryParameters is! Map<String, String?> ||
          queryParameters is! Map<String, Iterable<String>?>) {
        _logger(
          true,
          title: 'Delete - QueryParameters',
          data:
              'QueryParameters must be Map<String, String?> or Map<String, Iterable<String>?>',
        );
        return null;
      }
      uri = uri.replace(queryParameters: queryParameters);
      _logger(
        useLogger,
        title: 'Delete - QueryParameters',
        data: queryParameters,
      );
    }

    // Body
    if (body != null) {
      _logger(useLogger, title: 'Delete - Body', data: body);
    }
    try {
      return await _client
          .delete(
            uri,
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
