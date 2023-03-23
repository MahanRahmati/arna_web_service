import '/src/core.dart';

/// Abstract class to provide web service.
abstract class ArnaWebServiceController {
  /// Web service core
  final ArnaWebService webService = ArnaWebService.service();
}
