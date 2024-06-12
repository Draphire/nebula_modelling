// import 'package:flutter/material.dart';
// import 'package:flutter_bootstrap/flutter_bootstrap.dart';

// import '../renderer/control/control.dart';
// import '../utils/layoutUtils.dart';

// class ContainerWidget extends StatefulWidget {
//   const ContainerWidget(
//       {super.key,
//       this.controlInfo,
//       this.apiClient,
//       required this.inputData,
//       required this.updateInputData});

//   final controlInfo;
//   final apiClient;
//   final inputData;
//   final updateInputData;

//   @override
//   State<ContainerWidget> createState() => _ContainerWidgetState();
// }

// class _ContainerWidgetState extends State<ContainerWidget> {
//   List<BootstrapCol> containerChildren = [];

//   dynamic renderPage(containerChildren) {
//     for (var control in widget.controlInfo['children']!) {
//       // print('Page:${control}');
//       containerChildren.add(BootstrapCol(
//           sizes: buildLayoutColumn(control),
//           child: Container(
//               margin: EdgeInsets.only(bottom: 8.0),
//               child: ControlRenderer(
//                   controlInfo: control,
//                   apiClient: widget.apiClient,
//                   inputData: widget.inputData,
//                   updateInputData: widget.updateInputData))));
//     }
//     return containerChildren;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print('container:${widget.controlInfo["controlType"]}');

//     return BootstrapContainer(
//         fluid: true,
//         padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
//         // decoration: BoxDecoration(color: Colors.blue),
//         children: [BootstrapRow(children: renderPage(containerChildren))]);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import '../renderer/control/control.dart';
import '../utils/layoutUtils.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({
    super.key,
    this.controlInfo,
    this.apiClient,
    required this.inputData,
    required this.updateInputData,
  });

  final controlInfo;
  final apiClient;
  final inputData;
  final updateInputData;

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    // Generate container children dynamically
    List<BootstrapCol> containerChildren =
        widget.controlInfo['children']?.map<BootstrapCol>((control) {
              return BootstrapCol(
                sizes: buildLayoutColumn(control),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ControlRenderer(
                    controlInfo: control,
                    apiClient: widget.apiClient,
                    inputData: widget.inputData,
                    updateInputData: widget.updateInputData,
                  ),
                ),
              );
            }).toList() ??
            [];

    return BootstrapContainer(
      fluid: true,
      // padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      children: [BootstrapRow(children: containerChildren)],
    );
  }
}
