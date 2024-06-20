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

dynamic resolveReferences(
  dynamic object,
  dynamic state, {
  Map<String, dynamic>? customObjects = const {},
  bool withError = false,
  bool forPreviewBox = false,
}) {
  if (object == '{{{}}}') return '';
  final reservedKeyword = ['app']; // Keywords that slow down the app
  object = object is String ? object : Map.from(object);
  final objectType = object.runtimeType;
  String? error;

  switch (objectType) {
    case String:
      {
        if (object.contains('{{') &&
            object.contains('}}') &&
            object.contains('%%') &&
            object.contains('%%')) {
          object = resolveString(
            object,
            state,
            customObjects!,
            reservedKeyword,
            withError,
            forPreviewBox,
          );
        }

        // if (object.startsWith('{{') && object.endsWith('}}')) {
        //   final code = object.replaceAll('{{', '').replaceAll('}}', '');

        //   if (reservedKeyword.contains(code)) {
        //     error = '$code is a reserved keyword';
        //     return withError ? [object, error] : object;
        //   }

        //   return resolveCode(
        //     code,
        //     state,
        //     customObjects,
        //     withError,
        //     reservedKeyword,
        //     true,
        //   );
        // } else if (object.startsWith('%%') && object.endsWith('%%')) {
        //   final code = object.replaceAll('%%', '');

        //   if (code.contains('server.') &&
        //       !RegExp(r'^server\.[A-Za-z0-9]+$').hasMatch(code)) {
        //     error =
        //         '$code is invalid. Server variables can\'t be used like this';
        //     return withError ? [object, error] : object;
        //   }

        //   return resolveCode(
        //     code,
        //     state,
        //     customObjects,
        //     withError,
        //     reservedKeyword,
        //     false,
        //   );
        // }

        // final dynamicVariables = getDynamicVariables(object);

        // if (dynamicVariables != null) {
        //   if (dynamicVariables.length == 1 && dynamicVariables[0] == object) {
        //     object = resolveReferences(
        //       dynamicVariables[0],
        //       state,
        //       customObjects: customObjects,
        //     );
        //   } else {
        //     for (final dynamicVariable in dynamicVariables) {
        //       final value = resolveReferences(
        //         dynamicVariable,
        //         state,
        //         customObjects: customObjects,
        //       );
        //       if (value is! Function) {
        //         object = object.replaceAll(dynamicVariable, value);
        //       }
        //     }
        //   }
      }

      return withError ? [object, error] : object;
  }

  // case List:
  //   {
  //     final newArray = object.map((element) {
  //       final resolvedObject = resolveReferences(element, state);
  //       return resolvedObject;
  //     }).toList();

  //     return withError ? [newArray, error] : newArray;
  //   }

  // case Map:
  //   {
  //     if (object.isNotEmpty) {
  //       object.forEach((key, value) {
  //         final resolvedObject = resolveReferences(value, state);
  //         object[key] = resolvedObject;
  //       });
  //     }
  //     return withError ? [object, error] : object;
  //   }

  // default:
  //   {
  //     return withError ? [object, error] : object;
  //
}

// dynamic resolveCode(
//   String code,
//   dynamic state,
//   Map<String, dynamic>? customObjects,
//   bool withError,
//   List<String> reservedKeyword,
//   bool isJsCode,
// ) {
//   dynamic result = '';
//   String? error;

//   // don't resolve if code starts with "queries." and ends with "run()"
//   if (code.startsWith('queries.') && code.endsWith('run()')) {
//     error = 'Cannot resolve function call $code';
//   } else {
//     try {
//       final evalFunction = Function(
//         [
//           'variables',
//           'components',
//           'queries',
//           'globals',
//           'page',
//           'client',
//           'server',
//           'moment',
//           '_',
//           ...customObjects!.keys,
//           'reservedKeyword',
//         ].join(','),
//         'return $code;',
//       );
//       result = evalFunction(
//         isJsCode ? state.data['variables'] : null,
//         isJsCode ? state.data['components'] : null,
//         isJsCode ? state.data['queries'] : null,
//         isJsCode ? state.data['globals'] : null,
//         isJsCode ? state.data['page'] : null,
//         isJsCode ? null : state.data['client'],
//         isJsCode ? null : state.data['server'],
//         null, // moment, you might need to import a library for this
//         null, // _, you might need to import a library for this
//         ...customObjects.values,
//         null, // reservedKeyword
//       );
//     } catch (err) {
//       error = err.toString();
//       print('eval_error: $err');
//     }
//   }

//   return withError ? [result, error] : result;
// }

String resolveString(
  String str,
  dynamic state,
  Map<String, dynamic> customObjects,
  List<String> reservedKeyword,
  bool withError,
  bool forPreviewBox,
) {
  String resolvedStr = str;

  // Resolve {{object}}
  final codeRegex = RegExp(r'(\{\{.+?\}\})');
  final codeMatches = codeRegex.allMatches(resolvedStr);

  if (codeMatches.isNotEmpty) {
    codeMatches.forEach((match) {
      final codeMatch = match.group(0)!;
      final code = codeMatch.replaceAll('{{', '').replaceAll('}}', '');

      // if (reservedKeyword.contains(code)) {
      //   resolvedStr = resolvedStr.replaceAll(codeMatch, '');
      // } else {
      //   final resolvedCode = resolveCode(
      //     code,
      //     state,
      //     customObjects,
      //     withError,
      //     reservedKeyword,
      //     true,
      //   );
      //   resolvedStr = resolvedStr.replaceAll(codeMatch, resolvedCode.toString());
      // }
    });
  }

  // Resolve %%object%%
  final serverRegex = RegExp(r'(%%.+?%%)');
  final serverMatches = serverRegex.allMatches(resolvedStr);

  if (serverMatches.isNotEmpty) {
    serverMatches.forEach((match) {
      final serverMatch = match.group(0)!;
      final code = serverMatch.replaceAll('%%', '');

      // if (code.contains('server.') && !RegExp(r'^server\.[A-Za-z0-9]+$').hasMatch(code)) {
      //   resolvedStr = resolvedStr.replaceAll(serverMatch, 'HiddenEnvironmentVariable');
      // } else {
      //   final resolvedCode = resolveCode(
      //     code,
      //     state,
      //     customObjects,
      //     withError,
      //     reservedKeyword,
      //     false,
      //   );
      //   resolvedStr = resolvedStr.replaceAll(serverMatch, resolvedCode.toString());
      // }
    });
  }

  return resolvedStr;
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
