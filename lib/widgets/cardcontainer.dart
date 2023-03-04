import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:nebula_modelling/widgets/avatar.dart';

import '../utils/layoutUtils.dart';

class CardContainerWidget extends StatefulWidget {
  const CardContainerWidget({super.key, required this.controlInfo});
  final controlInfo;

  @override
  State<CardContainerWidget> createState() => _CardContainerWidgetState();
}

const defaultAvatarUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NaQfZLRZPcTPRzyWFAf9LbADkmt3dhyrzjLSy4I&s";

class _CardContainerWidgetState extends State<CardContainerWidget> {
  Widget renderWidget(controlInfo, cardData) {
    print('card redner widget${controlInfo} ${cardData}');
    switch (controlInfo['controlType']) {
      case 'label':
        // String jsonsDataString = cardData.toString();
        // final jsonData = jsonDecode(jsonsDataString);
        // print('${jsonData} ${jsonData[controlInfo['id']]}');
        final id = controlInfo['id'];
        print("before label card widget:${id} ${cardData[id]}");
        return Text(
          cardData[id],
          style: getTextStyle(widget.controlInfo),
        );
      case 'avatar':
        return CircleAvatar(
            radius: 25.0,
            child: ClipOval(
              child: Image.network(
                cardData[controlInfo['id']] ?? defaultAvatarUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ));

      default:
        return Text('${controlInfo["controlType"]} is not yet supported');
    }
  }

  Widget renderWidgetColumn(controlInfoList, cardData) {
    final List<BootstrapCol> widgetList = [];
    print('card redner widget columnS${controlInfoList}');

    for (var control in controlInfoList) {
      print("in column widget ${control}");
      widgetList.add(BootstrapCol(
          sizes: buildLayoutColumn(control),
          child: renderWidget(control, cardData)));
    }
    return BootstrapRow(
      children: widgetList,
    );
  }

  dynamic getCardOptions(controlInfo, cardData, Function menuClick) {
    Widget? leadingContent;
    Widget? headerContent;
    Widget? bodyContent;
    dynamic popupMenuContent = [];
    print('card redner widget${controlInfo['header']}');

    final headerInfo = controlInfo['header'];
    final bodyInfo = controlInfo['body'];
    if (headerInfo != null) {
      headerContent = renderWidgetColumn(headerInfo['title'], cardData);
      leadingContent = CircleAvatar(
          radius: 25.0,
          child: ClipOval(
            child: Image.network(
              cardData[controlInfo['id']] ?? defaultAvatarUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ));
      // renderWidgetColumn(headerInfo['leading'], cardData);
      if (headerInfo["menu"] != null &&
          headerInfo["menu"]["children"] != null) {
        popupMenuContent = headerInfo["menu"]["children"];
      }
    }
    // leadingContent = renderWidget(controlInfo, cardData)
    if (bodyInfo != null) {
      bodyContent = renderWidgetColumn(bodyInfo['children'], cardData);
    }

    return {
      "title": headerContent,
      "leading": leadingContent,
      "subtitle": bodyContent,
      "popupMenu": popupMenuContent,
    };
  }

  @override
  Widget build(BuildContext context) {
    final users = [
      {
        "Username": "Ghautam",
        "Userdescription": "Ghautam",
        "Email": "ghautam@gmail.com"
      },
      {
        "Username": "Geeteka",
        "Userdescription": "Geeteka",
        "Email": "geeteka@gmail.com"
      },
      {
        "Username": "Harish",
        "Userdescription": "Harish",
        "Email": "harish@gmail.com"
      },
      {
        "Username": "Ghautam",
        "Userdescription": "Ghautam",
        "Email": "ghautam@gmail.com"
      },
      {
        "Username": "Geeteka",
        "Userdescription": "Geeteka",
        "Email": "geeteka@gmail.com"
      },
      {
        "Username": "Harish",
        "Userdescription": "Harish",
        "Email": "harish@gmail.com"
      },
      {
        "Username": "Ghautam",
        "Userdescription": "Ghautam",
        "Email": "ghautam@gmail.com"
      },
      {
        "Username": "Geeteka",
        "Userdescription": "Geeteka",
        "Email": "geeteka@gmail.com"
      },
      {
        "Username": "Harish",
        "Userdescription": "Harish",
        "Email": "harish@gmail.com"
      },
    ];

    final cards = users
        .map((user) =>
            getCardOptions(widget.controlInfo['template'][0], user, () {}))
        .toList();
    return SingleChildScrollView(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        print(cards);
        print(index);
        return Card(
          child: ListTile(
            leading: cards[index]['leading'],
            //     AvatarWidget(controlInfo: {
            //   "controlType": "avatar",
            //   "avatarUrl":
            //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NaQfZLRZPcTPRzyWFAf9LbADkmt3dhyrzjLSy4I&s",
            // }),
            title: cards[index]['title'],
            subtitle: cards[index]['subtitle'],
            // [
            //   Text(users[index]['Email']!),
            //   Text(users[index]['Email']!),
            //   Text(users[index]['Email']!),
            //   Text(users[index]['Email']!)
            // ]),
            trailing: PopupMenuButton<dynamic>(
              onSelected: (dynamic value) {
                // if (value == 'block') {
                //   print("onSelected-block");
                //   // TODO: Implement block user functionality
                // } else if (value == 'unblock') {
                //   // TODO: Implement unblock user functionality
                // } else if (value == 'delete') {
                //   // TODO: Implement delete user functionality
                // }
              },
              itemBuilder: (BuildContext context) {
                print("popup ${cards[index]['popupMenu']}");
                return cards[index]['popupMenu']
                    .map<PopupMenuItem<dynamic>>((dynamic option) {
                  return PopupMenuItem<dynamic>(
                    value: option['code'],
                    child: Text(option['desc']),
                    onTap: () {
                      print(option);
                    },
                  );
                }).toList();
              },
            ),
          ),
        );
      },
    ));
  }
}
