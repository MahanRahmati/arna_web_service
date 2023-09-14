// ignore_for_file: constant_identifier_names, no_default_cases

/// HTTP status code
enum StatusCode {
  /// 100 Continue
  /// [[RFC7231, Section 6.2.1](https://tools.ietf.org/html/rfc7231#section-6.2.1)]
  CONTINUE(100, 'Continue'),

  /// 101 Switching Protocols
  /// [[RFC7231, Section 6.2.2](https://tools.ietf.org/html/rfc7231#section-6.2.2)]
  SWITCHING_PROTOCOLS(101, 'Switching Protocols'),

  /// 102 Processing
  /// [[RFC2518](https://tools.ietf.org/html/rfc2518)]
  PROCESSING(102, 'Processing'),

  /// 200 OK
  /// [[RFC7231, Section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1)]
  OK(200, 'OK'),

  /// 201 Created
  /// [[RFC7231, Section 6.3.2](https://tools.ietf.org/html/rfc7231#section-6.3.2)]
  CREATED(201, 'Created'),

  /// 202 Accepted
  /// [[RFC7231, Section 6.3.3](https://tools.ietf.org/html/rfc7231#section-6.3.3)]
  ACCEPTED(202, 'Accepted'),

  /// 203 Non-Authoritative Information
  /// [[RFC7231, Section 6.3.4](https://tools.ietf.org/html/rfc7231#section-6.3.4)]
  NON_AUTHORITATIVE_INFORMATION(203, 'Non Authoritative Information'),

  /// 204 No Content
  /// [[RFC7231, Section 6.3.5](https://tools.ietf.org/html/rfc7231#section-6.3.5)]
  NO_CONTENT(204, 'No Content'),

  /// 205 Reset Content
  /// [[RFC7231, Section 6.3.6](https://tools.ietf.org/html/rfc7231#section-6.3.6)]
  RESET_CONTENT(205, 'Reset Content'),

  /// 206 Partial Content
  /// [[RFC7233, Section 4.1](https://tools.ietf.org/html/rfc7233#section-4.1)]
  PARTIAL_CONTENT(206, 'Partial Content'),

  /// 207 Multi-Status
  /// [[RFC4918](https://tools.ietf.org/html/rfc4918)]
  MULTI_STATUS(207, 'Multi-Status'),

  /// 208 Already Reported
  /// [[RFC5842](https://tools.ietf.org/html/rfc5842)]
  ALREADY_REPORTED(208, 'Already Reported'),

  /// 226 IM Used
  /// [[RFC3229](https://tools.ietf.org/html/rfc3229)]
  IM_USED(226, 'IM Used'),

  /// 300 Multiple Choices
  /// [[RFC7231, Section 6.4.1](https://tools.ietf.org/html/rfc7231#section-6.4.1)]
  MULTIPLE_CHOICES(300, 'Multiple Choices'),

  /// 301 Moved Permanently
  /// [[RFC7231, Section 6.4.2](https://tools.ietf.org/html/rfc7231#section-6.4.2)]
  MOVED_PERMANENTLY(301, 'Moved Permanently'),

  /// 302 Found
  /// [[RFC7231, Section 6.4.3](https://tools.ietf.org/html/rfc7231#section-6.4.3)]
  FOUND(302, 'Found'),

  /// 303 See Other
  /// [[RFC7231, Section 6.4.4](https://tools.ietf.org/html/rfc7231#section-6.4.4)]
  SEE_OTHER(303, 'See Other'),

  /// 304 Not Modified
  /// [[RFC7232, Section 4.1](https://tools.ietf.org/html/rfc7232#section-4.1)]
  NOT_MODIFIED(304, 'Not Modified'),

  /// 305 Use Proxy
  /// [[RFC7231, Section 6.4.5](https://tools.ietf.org/html/rfc7231#section-6.4.5)]
  USE_PROXY(305, 'Use Proxy'),

  /// 307 Temporary Redirect
  /// [[RFC7231, Section 6.4.7](https://tools.ietf.org/html/rfc7231#section-6.4.7)]
  TEMPORARY_REDIRECT(307, 'Temporary Redirect'),

  /// 308 Permanent Redirect
  /// [[RFC7238](https://tools.ietf.org/html/rfc7238)]
  PERMANENT_REDIRECT(308, 'Permanent Redirect'),

  /// 400 Bad Request
  /// [[RFC7231, Section 6.5.1](https://tools.ietf.org/html/rfc7231#section-6.5.1)]
  BAD_REQUEST(400, 'Bad Request'),

  /// 401 Unauthorized
  /// [[RFC7235, Section 3.1](https://tools.ietf.org/html/rfc7235#section-3.1)]
  UNAUTHORIZED(401, 'Unauthorized'),

  /// 402 Payment Required
  /// [[RFC7231, Section 6.5.2](https://tools.ietf.org/html/rfc7231#section-6.5.2)]
  PAYMENT_REQUIRED(402, 'Payment Required'),

  /// 403 Forbidden
  /// [[RFC7231, Section 6.5.3](https://tools.ietf.org/html/rfc7231#section-6.5.3)]
  FORBIDDEN(403, 'Forbidden'),

  /// 404 Not Found
  /// [[RFC7231, Section 6.5.4](https://tools.ietf.org/html/rfc7231#section-6.5.4)]
  NOT_FOUND(404, 'Not Found'),

  /// 405 Method Not Allowed
  /// [[RFC7231, Section 6.5.5](https://tools.ietf.org/html/rfc7231#section-6.5.5)]
  METHOD_NOT_ALLOWED(405, 'Method Not Allowed'),

  /// 406 Not Acceptable
  /// [[RFC7231, Section 6.5.6](https://tools.ietf.org/html/rfc7231#section-6.5.6)]
  NOT_ACCEPTABLE(406, 'Not Acceptable'),

  /// 407 Proxy Authentication Required
  /// [[RFC7235, Section 3.2](https://tools.ietf.org/html/rfc7235#section-3.2)]
  PROXY_AUTHENTICATION_REQUIRED(407, 'Proxy Authentication Required'),

  /// 408 Request Timeout
  /// [[RFC7231, Section 6.5.7](https://tools.ietf.org/html/rfc7231#section-6.5.7)]
  REQUEST_TIMEOUT(408, 'Request Timeout'),

  /// 409 Conflict
  /// [[RFC7231, Section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8)]
  CONFLICT(409, 'Conflict'),

  /// 410 Gone
  /// [[RFC7231, Section 6.5.9](https://tools.ietf.org/html/rfc7231#section-6.5.9)]
  GONE(410, 'Gone'),

  /// 411 Length Required
  /// [[RFC7231, Section 6.5.10](https://tools.ietf.org/html/rfc7231#section-6.5.10)]
  LENGTH_REQUIRED(411, 'Length Required'),

  /// 412 Precondition Failed
  /// [[RFC7232, Section 4.2](https://tools.ietf.org/html/rfc7232#section-4.2)]
  PRECONDITION_FAILED(412, 'Precondition Failed'),

  /// 413 Payload Too Large
  /// [[RFC7231, Section 6.5.11](https://tools.ietf.org/html/rfc7231#section-6.5.11)]
  PAYLOAD_TOO_LARGE(413, 'Payload Too Large'),

  /// 414 URI Too Long
  /// [[RFC7231, Section 6.5.12](https://tools.ietf.org/html/rfc7231#section-6.5.12)]
  URI_TOO_LONG(414, 'URI Too Long'),

  /// 415 Unsupported Media Type
  /// [[RFC7231, Section 6.5.13](https://tools.ietf.org/html/rfc7231#section-6.5.13)]
  UNSUPPORTED_MEDIA_TYPE(415, 'Unsupported Media Type'),

  /// 416 Range Not Satisfiable
  /// [[RFC7233, Section 4.4](https://tools.ietf.org/html/rfc7233#section-4.4)]
  RANGE_NOT_SATISFIABLE(416, 'Range Not Satisfiable'),

  /// 417 Expectation Failed
  /// [[RFC7231, Section 6.5.14](https://tools.ietf.org/html/rfc7231#section-6.5.14)]
  EXPECTATION_FAILED(417, 'Expectation Failed'),

  /// 418 I'm a teapot
  /// [curiously not registered by IANA but [RFC2324](https://tools.ietf.org/html/rfc2324)]
  IM_A_TEAPOT(418, "I'm a teapot"),

  /// 421 Misdirected Request
  /// [RFC7540, Section 9.1.2](http://tools.ietf.org/html/rfc7540#section-9.1.2)
  MISDIRECTED_REQUEST(421, 'Misdirected Request'),

  /// 422 Unprocessable Entity
  /// [[RFC4918](https://tools.ietf.org/html/rfc4918)]
  UNPROCESSABLE_ENTITY(422, 'Unprocessable Entity'),

  /// 423 Locked
  /// [[RFC4918](https://tools.ietf.org/html/rfc4918)]
  LOCKED(423, 'Locked'),

  /// 424 Failed Dependency
  /// [[RFC4918](https://tools.ietf.org/html/rfc4918)]
  FAILED_DEPENDENCY(424, 'Failed Dependency'),

  /// 426 Upgrade Required
  /// [[RFC7231, Section 6.5.15](https://tools.ietf.org/html/rfc7231#section-6.5.15)]
  UPGRADE_REQUIRED(426, 'Upgrade Required'),

  /// 428 Precondition Required
  /// [[RFC6585](https://tools.ietf.org/html/rfc6585)]
  PRECONDITION_REQUIRED(428, 'Precondition Required'),

  /// 429 Too Many Requests
  /// [[RFC6585](https://tools.ietf.org/html/rfc6585)]
  TOO_MANY_REQUESTS(429, 'Too Many Requests'),

  /// 431 Request Header Fields Too Large
  /// [[RFC6585](https://tools.ietf.org/html/rfc6585)]
  REQUEST_HEADER_FIELDS_TOO_LARGE(431, 'Request Header Fields Too Large'),

  /// 451 Unavailable For Legal Reasons
  /// [[RFC7725](http://tools.ietf.org/html/rfc7725)]
  UNAVAILABLE_FOR_LEGAL_REASONS(451, 'Unavailable For Legal Reasons'),

  /// 500 Internal Server Error
  /// [[RFC7231, Section 6.6.1](https://tools.ietf.org/html/rfc7231#section-6.6.1)]
  INTERNAL_SERVER_ERROR(500, 'Internal Server Error'),

  /// 501 Not Implemented
  /// [[RFC7231, Section 6.6.2](https://tools.ietf.org/html/rfc7231#section-6.6.2)]
  NOT_IMPLEMENTED(501, 'Not Implemented'),

  /// 502 Bad Gateway
  /// [[RFC7231, Section 6.6.3](https://tools.ietf.org/html/rfc7231#section-6.6.3)]
  BAD_GATEWAY(502, 'Bad Gateway'),

  /// 503 Service Unavailable
  /// [[RFC7231, Section 6.6.4](https://tools.ietf.org/html/rfc7231#section-6.6.4)]
  SERVICE_UNAVAILABLE(503, 'Service Unavailable'),

  /// 504 Gateway Timeout
  /// [[RFC7231, Section 6.6.5](https://tools.ietf.org/html/rfc7231#section-6.6.5)]
  GATEWAY_TIMEOUT(504, 'Gateway Timeout'),

  /// 505 HTTP Version Not Supported
  /// [[RFC7231, Section 6.6.6](https://tools.ietf.org/html/rfc7231#section-6.6.6)]
  HTTP_VERSION_NOT_SUPPORTED(505, 'HTTP Version Not Supported'),

  /// 506 Variant Also Negotiates
  /// [[RFC2295](https://tools.ietf.org/html/rfc2295)]
  VARIANT_ALSO_NEGOTIATES(506, 'Variant Also Negotiates'),

  /// 507 Insufficient Storage
  /// [[RFC4918](https://tools.ietf.org/html/rfc4918)]
  INSUFFICIENT_STORAGE(507, 'Insufficient Storage'),

  /// 508 Loop Detected
  /// [[RFC5842](https://tools.ietf.org/html/rfc5842)]
  LOOP_DETECTED(508, 'Loop Detected'),

  /// 510 Not Extended
  /// [[RFC2774](https://tools.ietf.org/html/rfc2774)]
  NOT_EXTENDED(510, 'Not Extended'),

  /// 511 Network Authentication Required
  /// [[RFC6585](https://tools.ietf.org/html/rfc6585)]
  NETWORK_AUTHENTICATION_REQUIRED(511, 'Network Authentication Required');

  /// The structure of HTTP status code.
  const StatusCode(this.code, this.description);

  /// The code of HTTP status code.
  final int code;

  /// The description of HTTP status code.
  final String description;

  /// Check if status is within 100-199.
  bool isInformational() => 200 > code && code >= 100;

  /// Check if status is within 200-299.
  bool isSuccess() => 300 > code && code >= 200;

  /// Check if status is within 300-399.
  bool isRedirection() => 400 > code && code >= 300;

  /// Check if status is within 400-499.
  bool isClientError() => 500 > code && code >= 400;

  /// Check if status is within 500-599.
  bool isServerError() => 600 > code && code >= 500;

  /// Throw exception if status code is not successful.
  void throwException() {
    switch (this) {
      case StatusCode.OK:
      case StatusCode.CREATED:
      case StatusCode.ACCEPTED:
      case StatusCode.NON_AUTHORITATIVE_INFORMATION:
      case StatusCode.NO_CONTENT:
      case StatusCode.RESET_CONTENT:
      case StatusCode.PARTIAL_CONTENT:
      case StatusCode.MULTI_STATUS:
      case StatusCode.ALREADY_REPORTED:
      case StatusCode.IM_USED:
        break;
      default:
        throw Exception(toString());
    }
  }

  /// Get HTTP status code from code.
  static StatusCode? getByCode(final int code) {
    for (final StatusCode statusCode in StatusCode.values) {
      if (statusCode.code == code) {
        return statusCode;
      }
    }
    return null;
  }

  /// Get HTTP status description from code.
  static String? getDescriptionByCode(final int code) {
    for (final StatusCode statusCode in StatusCode.values) {
      if (statusCode.code == code) {
        return statusCode.description;
      }
    }
    return null;
  }

  @override
  String toString() => 'StatusCode($code, $description)';
}
