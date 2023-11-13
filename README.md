<p align="center">
  <a href="https://pub.dartlang.org/packages/arna_web_service"><img src="https://img.shields.io/pub/v/arna_web_service.svg" alt="pub.dev"></a>
  <a href="https://github.com/MahanRahmati/"><img src="https://img.shields.io/badge/Maintainer-MahanRahmati-informational"></a>
  <a href="https://github.com/MahanRahmati/arna_web_service/actions/workflows/pana_analysis.yml"><img src="https://github.com/MahanRahmati/arna_web_service/actions/workflows/pana_analysis.yml/badge.svg"></a>
  <a href="https://github.com/MahanRahmati/arna_web_service/actions/workflows/flutter_analysis.yml"><img src="https://github.com/MahanRahmati/arna_web_service/actions/workflows/flutter_analysis.yml/badge.svg"></a>
  <img src="https://img.shields.io/github/license/MahanRahmati/arna_web_service">
</p>

## Introduction

This is a Flutter plugin that provides a simple and powerful way to connect to HTTP-based web services from your Flutter app.

## Installation

Add Arna Web Service as a dependency in your pubspec.yaml:

```yaml
dependencies:
  arna_web_service: ^2.5.0
```

Then, run flutter pub get to install the package.

## Usage

To use the web Service in your application, simply import the package:

```dart
import 'package:arna_web_service/arna_web_service.dart';
```

After that extend your class:

```dart
class APIController extends ArnaWebServiceController  {}
```

Or directly create an instance:

```dart
final ArnaWebService webService = ArnaWebService.service();
```

You can then use the web service to make API calls:

```dart
final Response? response = await webService.get(
  Uri.parse('https://api.ipify.org'),
);

```

## License

Arna Web Service is [BSD 3-Clause licensed](./LICENSE).

## Contributing

Contributions are welcome! If you find a bug or want to add a new feature, please open an issue or submit a pull request.
