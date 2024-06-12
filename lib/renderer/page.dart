import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'control/control.dart';
import '../utils/layoutUtils.dart';

class PageRenderer extends StatefulWidget {
  final List<dynamic>
      metadata; // Changed to List<dynamic> to represent array of objects
  final dynamic apiClient;

  PageRenderer({
    required this.metadata,
    required this.apiClient,
  });

  @override
  State<PageRenderer> createState() => _PageRendererState();
}

class _PageRendererState extends State<PageRenderer> {
  List<BootstrapCol> pageChildren = [];
  dynamic inputData = {};

  void updateInputData(dynamic newData) {
    print("in updater $newData");
    setState(() {
      inputData.addAll(newData);
    });
  }

  dynamic renderPage(dynamic metaData) {
    if (metaData == null || metaData['children'] == null) {
      return BootstrapCol(
        sizes: 'col-12',
        child: Text('No metadata available'),
      );
    }

    return BootstrapCol(
      sizes: buildLayoutColumn(metaData),
      child: ControlRenderer(
        controlInfo: metaData,
        apiClient: widget.apiClient,
        inputData: inputData,
        updateInputData: updateInputData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BootstrapRow(
      children: widget.metadata
          .map<BootstrapCol>((metaData) => renderPage(metaData))
          .toList(),
    );
  }
}
