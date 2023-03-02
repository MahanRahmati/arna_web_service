<p align="center">
  <a href="https://pub.dartlang.org/packages/arna_web_service"><img src="https://img.shields.io/pub/v/arna_web_service.svg" alt="pub.dev"></a>
  <a href="https://github.com/MahanRahmati/"><img src="https://img.shields.io/badge/Maintainer-MahanRahmati-informational"></a>
  <a href="https://github.com/MahanRahmati/arna_web_service/actions/workflows/pana_analysis.yml"><img src="https://github.com/MahanRahmati/arna_web_service/actions/workflows/pana_analysis.yml/badge.svg"></a>
  <a href="https://github.com/MahanRahmati/arna_web_service/actions/workflows/flutter_analysis.yml"><img src="https://github.com/MahanRahmati/arna_web_service/actions/workflows/flutter_analysis.yml/badge.svg"></a>
  <img src="https://img.shields.io/github/license/MahanRahmati/arna_web_service">
</p>

## Introduction

A simple and powerful HTTP package for Flutter.

## Getting Started

Add Arna Web Service as a dependency in your pubspec.yaml:

```yaml
dependencies:
  arna_web_service: ^1.0.0
```

Import it:

```dart
import 'package:arna_web_service/arna_web_service.dart';
```

Use it!

```dart
final ArnaWebService webService = ArnaWebService.service();
final Response? response = await webService.get(
  Uri.parse('https://api.ipify.org'),
);

```
