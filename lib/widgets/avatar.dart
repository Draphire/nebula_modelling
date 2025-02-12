import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget(
      {super.key,
      required this.controlInfo,
      required this.inputData,
      required this.updateInputData});
  final controlInfo;
  final inputData;
  final updateInputData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.0,
      child: ClipOval(
        child: Image.network(
          controlInfo['avatarUrl'],
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      // backgroundImage: NetworkImage(controlInfo['avatarUrl'] )
    );
  }
}
