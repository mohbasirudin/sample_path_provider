import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageHome(),
    );
  }
}

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  var path = "-";

  void _getPath() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      path = dir.path;
    } catch (e) {
      path = "error path: $e";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample Path Provider"),
      ),
      body: Center(
        child: Text(path),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: _getPath,
        child: const Text("Get Path"),
      ),
    );
  }
}
