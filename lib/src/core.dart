import 'package:arna_logger/arna_logger.dart' show arnaLogger;
import 'package:connectivity_plus/connectivity_plus.dart'
    show Connectivity, ConnectivityResult;
import 'package:dio/dio.dart'
    show BaseOptions, Dio, DioException, DioExceptionType, Response;

/// The class that takes care of HTTP client and connections across multiple
/// requests to the server.
class ArnaWebService {
  ArnaWebService._();

  /// Creates an ArnaDioWebService.
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

    _logger(useLogger, title: 'Head - QueryParameters', data: queryParameters);

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeoutDuration,
        queryParameters: queryParameters,
        headers: finalHeaders,
      ),
    );

    try {
      final Response<T> response = await dio.getUri(uri);
      _logger(useLogger, title: 'Head - Response', data: response);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        _logger(useLogger, title: 'Head - Timeout', data: e);
        onTimeout?.call();
        return null;
      }
      _logger(useLogger, title: 'Head - Error', data: e);
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Head - Error', data: e);
      return null;
    }
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

    _logger(useLogger, title: 'Get - QueryParameters', data: queryParameters);

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeoutDuration,
        queryParameters: queryParameters,
        headers: finalHeaders,
      ),
    );

    try {
      final Response<T> response = await dio.headUri(uri);
      _logger(useLogger, title: 'Get - Response', data: response);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        _logger(useLogger, title: 'Get - Timeout', data: e);
        onTimeout?.call();
        return null;
      }
      _logger(useLogger, title: 'Get - Error', data: e);
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Get - Error', data: e);
      return null;
    }
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

    _logger(useLogger, title: 'Post - QueryParameters', data: queryParameters);

    _logger(useLogger, title: 'Post - Body', data: body);

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeoutDuration,
        queryParameters: queryParameters,
        headers: finalHeaders,
      ),
    );

    try {
      final Response<T> response = await dio.postUri(uri, data: body);
      _logger(useLogger, title: 'Post - Response', data: response);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        _logger(useLogger, title: 'Post - Timeout', data: e);
        onTimeout?.call();
        return null;
      }
      _logger(useLogger, title: 'Post - Error', data: e);
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Post - Error', data: e);
      return null;
    }
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

    _logger(useLogger, title: 'Put - QueryParameters', data: queryParameters);

    _logger(useLogger, title: 'Put - Body', data: body);

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeoutDuration,
        queryParameters: queryParameters,
        headers: finalHeaders,
      ),
    );

    try {
      final Response<T> response = await dio.putUri(uri, data: body);
      _logger(useLogger, title: 'Put - Response', data: response);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        _logger(useLogger, title: 'Put - Timeout', data: e);
        onTimeout?.call();
        return null;
      }
      _logger(useLogger, title: 'Put - Error', data: e);
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Put - Error', data: e);
      return null;
    }
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

    _logger(useLogger, title: 'Patch - QueryParameters', data: queryParameters);

    _logger(useLogger, title: 'Patch - Body', data: body);

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeoutDuration,
        queryParameters: queryParameters,
        headers: finalHeaders,
      ),
    );

    try {
      final Response<T> response = await dio.patchUri(uri, data: body);
      _logger(useLogger, title: 'Patch - Response', data: response);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        _logger(useLogger, title: 'Patch - Timeout', data: e);
        onTimeout?.call();
        return null;
      }
      _logger(useLogger, title: 'Patch - Error', data: e);
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Patch - Error', data: e);
      return null;
    }
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

    _logger(
      useLogger,
      title: 'Delete - QueryParameters',
      data: queryParameters,
    );

    _logger(useLogger, title: 'Delete - Body', data: body);

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeoutDuration,
        queryParameters: queryParameters,
        headers: finalHeaders,
      ),
    );

    try {
      final Response<T> response = await dio.deleteUri(uri, data: body);
      _logger(useLogger, title: 'Delete - Response', data: response);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        _logger(useLogger, title: 'Delete - Timeout', data: e);
        onTimeout?.call();
        return null;
      }
      _logger(useLogger, title: 'Delete - Error', data: e);
      return null;
    } catch (e) {
      _logger(useLogger, title: 'Delete - Error', data: e);
      return null;
    }
  }
}
