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

List<dynamic> parseOptions(String template, ViewModel viewModel) {
  RegExp exp = RegExp(r'\{\{(.+?)\}\}');
  Iterable<RegExpMatch> matches = exp.allMatches(template);
  List<dynamic> options = [];

  for (RegExpMatch match in matches) {
    String key = match.group(1) ?? '';
    // dynamic value = viewModel.currentState;

    dynamic value = viewModel.getValueFromPath(key);
    // for (String part in key.split('.')) {
    //   if (value != null &&
    //       value is Map<String, dynamic> &&
    //       value.containsKey(part)) {
    //     value = value[part];
    //   } else {
    //     value = [];
    //     break;
    //   }
    // }

    if (value is List) {
      options = value;
    }
  }

  return options;
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
    Map<String, dynamic> controlInfo, double screenWidth, double screenHeight) {
  final colLayout = controlInfo['layout']['colLayout'];
  final lg = colLayout['lg'];
  final col = _parseToDouble(
      lg['col'], 12); // Default to full width if no col value is provided
  final height = _parseToDouble(lg['height'], 200);

  // Calculate the width as a fraction of the screen width
  final width = (screenWidth / 12) * col;

  // Adjust the height to be more mobile-friendly
  final mobileHeight = height != null ? height * 0.5 : null;

  return {
    'width': width,
    'height': height ?? 200, // Provide a default height if none is provided
  };
}

double _parseToDouble(dynamic value, double defaultValue) {
  if (value == null) return defaultValue;
  if (value is String) {
    return double.tryParse(value) ?? defaultValue;
  } else if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  }
  return defaultValue;
}

// Map<String, double> applyLayout(
//     Map<String, dynamic> controlInfo, double screenWidth, double screenHeight) {
//   final colLayout = controlInfo['layout']['colLayout'];
//   final lg = colLayout['lg'];
//   final col = _parseToDouble(
//       lg['col'], 12); // Default to full width if no col value is provided
//   final height = _parseToDouble(lg['height'], 100);

//   // Calculate the width as a fraction of the screen width
//   final width = (screenWidth / 12) * col;

//   // Calculate the height based on a ratio of the screen height for mobile-friendliness
//   // For example, you can use a ratio of 0.2 to make it 20% of the screen height
//   final heightRatio = 0.2;
//   final adjustedHeight = height != null ? screenHeight * heightRatio : null;

//   return {
//     'width': width,
//     'height': height,
//   };
// }

// // Helper function to parse a value to double with a fallback
// double _parseToDouble(dynamic value, double fallback) {
//   if (value == null) {
//     return fallback;
//   }
//   if (value is String) {
//     return double.tryParse(value) ?? fallback;
//   }
//   if (value is num) {
//     return value.toDouble();
//   }
//   return fallback;
// }

// Map<String, double> applyLayout(
//     Map<String, dynamic> controlInfo, double screenWidth) {
//   final colLayout = controlInfo['layout']['colLayout'];
//   final lg = colLayout['lg'];
//   final col = _parseToDouble(
//       lg['col'], 12); // Default to full width if no col value is provided
//   final height = _parseToDouble(lg['height'], null);

//   // Calculate the width as a fraction of the screen width
//   final width = (screenWidth / 12) * col;

//   return {
//     'width': width,
//     'height': height,
//   };
// }

// double _parseToDouble(dynamic value, double? defaultValue) {
//   if (value == null) {
//     return defaultValue ?? 0.0;
//   } else if (value is int) {
//     return value.toDouble();
//   } else if (value is double) {
//     return value;
//   } else if (value is String) {
//     return double.tryParse(value) ?? (defaultValue ?? 0.0);
//   } else {
//     return defaultValue ?? 0.0;
//   }
// }
