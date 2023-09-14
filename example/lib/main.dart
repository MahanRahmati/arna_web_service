import 'package:arna_logger/arna_logger.dart';
import 'package:arna_web_service/arna_web_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ArnaWebServiceController {
  bool isLoading = false;

  Future<void> onButtonPressed() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      final Response? response = await webService.get(
        Uri.parse('https://api.ipify.org'),
      );
      setState(() => isLoading = false);
      final body = ResponseUtils().getBody(response);
      arnaLogger(title: 'Your IP', data: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Arna Web Service Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: onButtonPressed,
                child: Text(isLoading ? 'Loading...' : 'Click Me!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
