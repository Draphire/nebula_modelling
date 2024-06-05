import 'package:flutter/material.dart';

/// 'ADAPTER': returns Flutter IconData from Nebula iconKey
IconData getIconFromIconKey(String iconKey) {
  switch (iconKey) {
    case 'FilterFunnelFilled':
      return Icons.filter_alt_rounded;
    case 'KebabmenuStroke':
      return Icons.menu;
    case 'MailFilled':
      return Icons.email;
    case 'PhonedeviceStroke':
      return Icons.phone;
    case 'Search':
      return Icons.search;
    case 'UseraddStroke':
      return Icons.add_box_outlined;

    default:
      return Icons.close;
  }
}
