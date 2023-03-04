import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import '../renderer/control/control.dart';
import '../utils/layoutUtils.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key, this.controlInfo});

  final controlInfo;

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  List<BootstrapCol> containerChildren = [];

  dynamic renderPage(containerChildren) {
    for (var control in widget.controlInfo['children']!) {
      print('Page:${control}');
      containerChildren.add(BootstrapCol(
          sizes: buildLayoutColumn(control),
          child: ControlRenderer(
            controlInfo: control,
          )));
    }
    return containerChildren;
  }

  @override
  Widget build(BuildContext context) {
    print('container:${widget.controlInfo["controlType"]}');

    return BootstrapContainer(
        fluid: true,
        // decoration: BoxDecoration(color: Colors.blue),
        children: [BootstrapRow(children: renderPage(containerChildren))]);
  }
}
