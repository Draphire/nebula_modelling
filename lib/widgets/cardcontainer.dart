import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:nebula_modelling/services/restApi.dart';
import 'package:nebula_modelling/widgets/avatar.dart';
import 'package:http/http.dart' as http;

import '../utils/layoutUtils.dart';

class CardContainerWidget extends StatefulWidget {
  const CardContainerWidget(
      {super.key, required this.controlInfo, this.apiClient});
  final controlInfo;
  final apiClient;

  @override
  State<CardContainerWidget> createState() => _CardContainerWidgetState();
}

const defaultAvatarUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NaQfZLRZPcTPRzyWFAf9LbADkmt3dhyrzjLSy4I&s";

class _CardContainerWidgetState extends State<CardContainerWidget> {
  dynamic data;

  Widget renderWidget(controlInfo, cardData) {
    // print('card redner widget${controlInfo} ${cardData}');

    switch (controlInfo['controlType']) {
      case 'label':
        // String jsonsDataString = cardData.toString();
        // final jsonData = jsonDecode(jsonsDataString);
        // // print('${jsonData} ${jsonData[controlInfo['id']]}');
        final id = controlInfo['id'];
        // print("before label card widget:${id} ${cardData[id]}");
        return Text(
          cardData[id] ?? "",
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
    // print('card redner widget columnS${controlInfoList}');

    for (var control in controlInfoList) {
      // print("in column widget ${control}");
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
    // print('card redner widget${controlInfo['header']}');

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

  dynamic getEventResponse(eventInfo) {
    // dynamic response = await widget.apiClient.get('coreapiops/v1/users',
    //     headers: {
    //       'context-ou-id': 1,
    //       'context-lang-id': 1,
    //       'context-role': 'adminrole'
    //     });
    // print("here ${eventInfo['onLoad']}");
    if (eventInfo['onLoad'] != null) {
      dynamic onPageLoadInfo = eventInfo['onLoad'];
      if (onPageLoadInfo['handler'].toString().toLowerCase() == 'rest') {
        // print("here ${eventInfo['onLoad']}");

        return (doRestApiAction(onPageLoadInfo, widget)).then((value) => {
              setState(() {
                // print(value);
                data = prepareApiResponse(
                    value, onPageLoadInfo['response']['bindInfo']);
              })
            });
      }
    }

    // return response;
    // print("authro ${widget.apiClient.authToken}");
    // dynamic response = await http.get(
    //     Uri.parse("https://hrpsaasdemo.ramcouat.com:4602/coreapiops/v1/users"),
    //     headers: {
    //       'context-ou-id': '1',
    //       'context-lang-id': '1',
    //       'context-role-name': 'adminrole',
    //       'Authorization': 'Bearer ${widget.apiClient.authToken}',
    //     });
    // return json.decode(response.body);
  }

  Future<dynamic> _showMyDialog(BuildContext context) async {
    print("in _show");
    return await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        print("in _alert diw");

        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                print('Confirmed');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Future<void> showConfirmationDialog(BuildContext context) async {
  //   print("inside dialog");
  //   Widget cancelButton = TextButton(
  //     child: Text("Cancel"),
  //     onPressed: () {
  //       print("COnfirmation cancel");
  //     },
  //   );
  //   Widget launchButton = TextButton(
  //     child: Text("Delete"),
  //     onPressed: () {
  //       print("COnfirmation Delete");
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Confirmation Alert"),
  //     content: Text(
  //         "Launching this missile will destroy the entire universe. Is this what you intended to do?"),
  //     actions: [
  //       cancelButton,
  //       launchButton,
  //     ],
  //   );

  //   // show the dialog
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       print("in alert");
  //       return alert;
  //     },
  //   );
  // }

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
    dynamic onCardMenuClick(selectedMenuInfo) {
      print(selectedMenuInfo);

      if (selectedMenuInfo['eventInfo'] != null) {
        if (selectedMenuInfo['eventInfo']['confirmation'] != null) {
          print(selectedMenuInfo['eventInfo']['confirmation']);
          // showConfirmationDialog(context);
        }
      }
    }

    // print("codeval ${codeVal}");
    if (data == null) {
      // setState(() {
      //  ;
      // });
      getEventResponse(widget.controlInfo['eventInfo']);
      return Center(child: CircularProgressIndicator.adaptive());
    }
    // print('data card - ${data}');

    final cards = data.map((user) {
      // print(user);
      return getCardOptions(widget.controlInfo['template'][0], user, () {});
    }).toList();
    // final cards = [
    //   getCardOptions(widget.controlInfo['template'][0], data['data'][0], () {})
    // ];
    // print(cards);
    return SingleChildScrollView(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        // print(cards);
        // print(index);
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
                // _showMyDialog(context);
                //   // print("onSelected-block");
                //   // TODO: Implement block user functionality
                // } else if (value == 'unblock') {
                //   // TODO: Implement unblock user functionality
                // } else if (value == 'delete') {
                //   // TODO: Implement delete user functionality
                // }
              },
              itemBuilder: (BuildContext context) {
                // print("popup ${cards[index]['popupMenu']}");
                return cards[index]['popupMenu']
                    .map<PopupMenuItem<dynamic>>((dynamic option) {
                  return PopupMenuItem<dynamic>(
                    value: option['code'],
                    child: Text(option['desc']),
                    onTap: () {
                      // print(option);
                      // onCardMenuClick(option);
                      _showMyDialog(context);
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
