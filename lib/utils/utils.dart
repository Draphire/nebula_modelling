import '../model/redux/viewModel/viewModel.dart';

String parseTemplateString(String template, ViewModel viewModel) {
  final regex = RegExp(r'{{(.*?)}}');
  final matches = regex.allMatches(template);

  String result = template;

  for (final match in matches) {
    final fullMatch = match.group(0);
    final path = match.group(1);
    if (path != null) {
      final value = viewModel.getValueFromPath(path);
      print('Path: $path, Value: $value');
      result = result.replaceAll(fullMatch!, value?.toString() ?? '');
    }
  }
  return result;
}

// Map<String, dynamic> applyLayout(dynamic controlInfo) {
//   String? col = controlInfo['layout']['colLayout']['lg']['col'];
//   String? height = controlInfo['layout']['colLayout']['lg']['height'];

//   return {
//     'flex': int.tryParse(col ?? '') ?? 1,
//     'height': double.tryParse(height ?? '') ?? double.infinity,
//   };
// }

Map<String, double> applyLayout(
    Map<String, dynamic> controlInfo, double screenWidth) {
  final colLayout = controlInfo['layout']['colLayout'];
  final lg = colLayout['lg'];
  final col = _parseToDouble(
      lg['col'], 12); // Default to full width if no col value is provided
  final height = _parseToDouble(lg['height'], null);

  // Calculate the width as a fraction of the screen width
  final width = (screenWidth / 12) * col;

  return {
    'width': width,
    'height': height,
  };
}

double _parseToDouble(dynamic value, double? defaultValue) {
  if (value == null) {
    return defaultValue ?? 0.0;
  } else if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else if (value is String) {
    return double.tryParse(value) ?? (defaultValue ?? 0.0);
  } else {
    return defaultValue ?? 0.0;
  }
}
