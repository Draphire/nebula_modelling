import 'package:flutter/material.dart';
import 'package:nebula_modelling/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nebula',
      theme: nebulaTheme,
      home: NebulaBaseComponent(appTitle: 'Nebula'),
    );
  }
}

class NebulaBaseComponent extends StatefulWidget {
  const NebulaBaseComponent({super.key, required this.appTitle});
  final String appTitle;

  @override
  State<NebulaBaseComponent> createState() => _NebulaBaseComponentState();
}

class _NebulaBaseComponentState extends State<NebulaBaseComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: Container(
        child: Text('Dart Flutter'),
      ),
    );
  }
}
