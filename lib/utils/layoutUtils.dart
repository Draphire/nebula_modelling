import 'package:flutter/material.dart';

/// [buildLayoutColumn] method used to construct column layout based on Bootstrap layout
///
/// returns [columnLayout] string which denotes the bootstrap based responsive column width.
String buildLayoutColumn(controlInfo) {
  String columnLayout = " ";

  dynamic layout;
  if (controlInfo['layout'] != null) {
    layout = controlInfo['layout'];
  } else {
    return ' ';
  }
  // print(controlInfo);
  // print(layout);
  dynamic colLayout = layout['colLayout'];

  if (colLayout['xl'] != null) {
    columnLayout += 'col-xl-${colLayout['xl']} ';
  }
  if (colLayout['lg'] != null) {
    columnLayout += 'col-lg-${colLayout['lg']} ';
  }
  if (colLayout['md'] != null) {
    columnLayout += 'col-md-${colLayout['md']} ';
  }
  if (colLayout['sm'] != null) {
    columnLayout += 'col-sm-${colLayout['sm']} ';
  }
  if (colLayout['xs'] != null) {
    columnLayout += 'col-xs-${colLayout['xs']} ';
  }
  if (colLayout['col'] != null) {
    columnLayout += 'col-${colLayout['col']} ';
  }
  // print(columnLayout);
  return columnLayout;
}

/// return [TextStyle] for Label based on label type
TextStyle getTextStyle(controlInfo) {
  if (controlInfo["controlType"] == "label") {
    switch (controlInfo["type"].toString().toLowerCase()) {
      case "h1":
        return TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

      case "h2":
        return TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold);

      case "h3":
        return TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

      case "h4":
        return TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

      case "para":
        return TextStyle(fontSize: 18.0);

      case "subheading":
        return TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline);

      default:
        return TextStyle(fontSize: 16.0);
    }
  }
  return TextStyle(fontSize: 16.0);
}
