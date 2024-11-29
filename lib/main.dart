import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/qr_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Package',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Package'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const QrTagPage(name: "User", id: "1"));
          },
          child: const Text('mobile_scanner_package'),
        ),
      ),
    );
  }
}
