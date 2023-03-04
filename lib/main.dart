import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:nebula_modelling/renderer/page.dart';
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
  void initState() {
    super.initState();
    bootstrapGridParameters(
      gutterSize: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: SingleChildScrollView(
        child: BootstrapContainer(
          children: [PageRenderer()]

          //   BootstrapRow(
          //     height: 60,
          //     children: <BootstrapCol>[
          //       BootstrapCol(
          //         sizes: 'col-6',
          //         child: Text(
          //           'col 2 of 2',
          //         ),
          //       ),
          //       BootstrapCol(
          //         sizes: 'col-6',
          //         child: Text(
          //           'col 2 of 2',
          //         ),
          //       ),
          //     ],
          //   ),
          ,
        ),
      ),
    );
  }
}
