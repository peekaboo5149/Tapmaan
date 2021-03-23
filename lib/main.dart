import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:tapmaan/view/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tapmaan',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
