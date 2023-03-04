import 'package:flutter/material.dart';
import 'package:nebula_modelling/utils/iconAdapter.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.controlInfo});
  final controlInfo;

  @override
  Widget build(BuildContext context) {
    IconData iconData = getIconFromIconKey(controlInfo['iconKey']);
    return Icon(iconData);
  }
}
