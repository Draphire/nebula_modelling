import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:nebula_modelling/model/pageMetaData.dart';
import 'package:nebula_modelling/provider/metadataProvider.dart';
// import 'package:provider/provider.dart';

import '../utils/layoutUtils.dart';
import 'control/control.dart';

class PageRenderer extends StatefulWidget {
  final dynamic metadata;
  final apiClient;

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

    // List<BootstrapCol> children = [];
    // for (var control in metaData['children']) {
    // children.add(
    return BootstrapCol(
      sizes: buildLayoutColumn(metaData),
      child: ControlRenderer(
        controlInfo: metaData,
        apiClient: widget.apiClient,
        inputData: inputData,
        updateInputData: updateInputData,
      ),
      // ),
    );
    // }
    // return children;
  }

  @override
  Widget build(BuildContext context) {
    return BootstrapRow(
      children: [renderPage(widget.metadata)],
    );
  }
}
