import '/src/core.dart';

/// Abstract class to provide web service.
mixin class ArnaWebServiceController {
  /// Web service core
  final ArnaWebService webService = ArnaWebService.service();
}
