import 'package:arna_logger/arna_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

/// The class that takes care of HTTP client and connections across multiple
/// requests to the server.
class ArnaWebService {
  ArnaWebService._();

  /// Creates an ArnaWebService.
  factory ArnaWebService.service() => _arnaWebService;

  static final ArnaWebService _arnaWebService = ArnaWebService._();

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
  Future<Response<T>?> head<T>(
    final Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final void Function(DioException)? onDioException,
    final void Function(Object)? onException,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    return request(
      uri,
      method: 'HEAD',
      headers: headers,
      queryParameters: queryParameters,
      token: token,
      onConnectionError: onConnectionError,
      timeoutDuration: timeoutDuration,
      onTimeout: onTimeout,
      onDioException: onDioException,
      onException: onException,
      useLogger: useLogger,
      checkConnectivity: checkConnectivity,
    );
  }

  /// Sends an HTTP GET request with the given headers to the given URL.
  Future<Response<T>?> get<T>(
    final Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final void Function(DioException)? onDioException,
    final void Function(Object)? onException,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    return request(
      uri,
      method: 'GET',
      headers: headers,
      queryParameters: queryParameters,
      token: token,
      onConnectionError: onConnectionError,
      timeoutDuration: timeoutDuration,
      onTimeout: onTimeout,
      onDioException: onDioException,
      onException: onException,
      useLogger: useLogger,
      checkConnectivity: checkConnectivity,
    );
  }

  /// Sends an HTTP POST request with the given headers and body to the given
  /// URL.
  Future<Response<T>?> post<T>(
    final Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final void Function(DioException)? onDioException,
    final void Function(Object)? onException,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    return request(
      uri,
      method: 'POST',
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      token: token,
      onConnectionError: onConnectionError,
      timeoutDuration: timeoutDuration,
      onTimeout: onTimeout,
      onDioException: onDioException,
      onException: onException,
      useLogger: useLogger,
      checkConnectivity: checkConnectivity,
    );
  }

  /// Sends an HTTP PUT request with the given headers and body to the given
  /// URL.
  Future<Response<T>?> put<T>(
    final Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final void Function(DioException)? onDioException,
    final void Function(Object)? onException,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    return request(
      uri,
      method: 'PUT',
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      token: token,
      onConnectionError: onConnectionError,
      timeoutDuration: timeoutDuration,
      onTimeout: onTimeout,
      onDioException: onDioException,
      onException: onException,
      useLogger: useLogger,
      checkConnectivity: checkConnectivity,
    );
  }

  /// Sends an HTTP PATCH request with the given headers and body to the given
  /// URL.
  Future<Response<T>?> patch<T>(
    final Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final void Function(DioException)? onDioException,
    final void Function(Object)? onException,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    return request(
      uri,
      method: 'PATCH',
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      token: token,
      onConnectionError: onConnectionError,
      timeoutDuration: timeoutDuration,
      onTimeout: onTimeout,
      onDioException: onDioException,
      onException: onException,
      useLogger: useLogger,
      checkConnectivity: checkConnectivity,
    );
  }

  /// Sends an HTTP DELETE request with the given headers to the given URL.
  Future<Response<T>?> delete<T>(
    final Uri uri, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final void Function(DioException)? onDioException,
    final void Function(Object)? onException,
    final bool useLogger = false,
    final bool checkConnectivity = true,
  }) async {
    return request(
      uri,
      method: 'DELETE',
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      token: token,
      onConnectionError: onConnectionError,
      timeoutDuration: timeoutDuration,
      onTimeout: onTimeout,
      onDioException: onDioException,
      onException: onException,
      useLogger: useLogger,
      checkConnectivity: checkConnectivity,
    );
  }

  /// Sends an HTTP DELETE request with the given headers to the given URL.
  Future<Response<T>?> request<T>(
    final Uri uri, {
    required final String method,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? body,
    final String? token,
    final void Function()? onConnectionError,
    final Duration timeoutDuration = const Duration(seconds: 5),
    final void Function()? onTimeout,
    final void Function(DioException)? onDioException,
    final void Function(Object)? onException,
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
    _logger(useLogger, title: '$method - Headers', data: finalHeaders);

    _logger(
      useLogger,
      title: '$method - QueryParameters',
      data: queryParameters,
    );

    _logger(useLogger, title: '$method - Body', data: body);

    final Dio dio = Dio(
      BaseOptions(
        method: method,
        connectTimeout: timeoutDuration,
        queryParameters: queryParameters,
        headers: finalHeaders,
      ),
    );

    try {
      final Response<T> response = await dio.requestUri(uri, data: body);
      _logger(useLogger, title: '$method - Response', data: response);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        _logger(useLogger, title: '$method - Timeout', data: e);
        onTimeout?.call();
        return null;
      }
      _logger(useLogger, title: '$method - Error', data: e);
      onDioException?.call(e);
      return null;
    } catch (e) {
      _logger(useLogger, title: '$method - Error', data: e);
      onException?.call(e);
      return null;
    }
  }
}
