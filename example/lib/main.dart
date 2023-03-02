import 'package:arna/arna.dart';
import 'package:arna_logger/arna_logger.dart';
import 'package:arna_web_service/arna_web_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ArnaWebService webService = ArnaWebService.service();
  bool isLoading = false;

  Future<void> onButtonPressed() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      final Response? response = await webService.get(
        Uri.parse('https://api.ipify.org'),
      );
      setState(() => isLoading = false);
      arnaLogger(title: 'Your IP', data: response?.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ArnaApp(
      home: ArnaScaffold(
        headerBar: ArnaHeaderBar(title: 'Arna Web Service Demo'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ArnaButton.text(
                label: isLoading ? 'Loading...' : 'Click Me!',
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
