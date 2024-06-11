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
