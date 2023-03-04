import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import '../utils/layoutUtils.dart';
import 'control/control.dart';

class PageRenderer extends StatefulWidget {
  PageRenderer({super.key, this.apiClient});
  final apiClient;
  var metaData = {
    "children": [
      {
        "controlType": "textfield",
        "caption": "Textfield",
        "layout": {
          "colLayout": {
            "xl": 12,
            "lg": 12,
            "md": 12,
            "sm": 12,
            "xs": 12,
          }
        }
      },
      {
        "controlType": "button",
        "caption": "Textfield",
        "layout": {
          "colLayout": {
            "xl": 12,
            "lg": 12,
            "md": 12,
            "sm": 12,
            "xs": 12,
          }
        }
      },
      {
        "controlType": "container",
        "layout": {
          "colLayout": {
            "xl": 12,
            "lg": 12,
            "md": 12,
            "sm": 12,
            "xs": 12,
          }
        },
        "children": [
          {
            "controlType": "textfield",
            "caption": "Textfield",
            "layout": {
              "colLayout": {
                "xl": 12,
                "lg": 12,
                "md": 12,
                "sm": 12,
                "xs": 12,
              }
            }
          },
          {
            "controlType": "button",
            "caption": "Textfield",
            "layout": {
              "colLayout": {
                "xl": 12,
                "lg": 12,
                "md": 4,
                "sm": 12,
                "xs": 2,
              }
            }
          },
          {
            "controlType": "label",
            "caption": "Textfield H1",
            "type": "h1",
            "layout": {
              "colLayout": {
                "xl": 12,
                "lg": 12,
                "md": 4,
                "sm": 6,
                "xs": 2,
              }
            }
          },
          {
            "controlType": "label",
            "caption": "Textfield para",
            "type": "para",
            "layout": {
              "colLayout": {
                "xl": 12,
                "lg": 12,
                "md": 4,
                "sm": 6,
                "xs": 2,
              }
            }
          },
          {
            "controlType": "label",
            "caption": "Textfield subheading",
            "type": "subheading",
            "layout": {
              "colLayout": {
                "xl": 12,
                "lg": 12,
                "md": 4,
                "sm": 8,
                "xs": 2,
              }
            }
          },
          {
            "controlType": "icon",
            "caption": "Textfield subheading",
            "type": "subheading",
            "iconKey": "FilterFunnelFilled",
            "layout": {
              "colLayout": {
                "xl": 12,
                "lg": 12,
                "md": 4,
                "sm": 8,
                "xs": 2,
              }
            }
          },
          {
            "controlType": "avatar",
            "avatarUrl":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NaQfZLRZPcTPRzyWFAf9LbADkmt3dhyrzjLSy4I&s",
          },
          {
            "controlType": "cardcontainer",
            "numberOfCardsInRow": 4,
            "id": "userCardContainer",
            "template": [
              {
                "containerType": "cardcontainer",
                "templateId": "userCardBody",
                "header": {
                  "title": [
                    {"controlType": "label", "id": "Username"}
                  ],
                  "leading": [
                    {
                      "controlType": "avatar",
                      "layout": {
                        "colLayout": {"sm": 5, "col": 5}
                      },
                      "avatarUrl":
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NaQfZLRZPcTPRzyWFAf9LbADkmt3dhyrzjLSy4I&s"
                    }
                  ],
                  "optionsIconKey": "KebabmenuStroke",
                  "className": "",
                  "menu": {
                    "children": [
                      {
                        "code": "manageAccess",
                        "desc": "ManageAccess",
                        "icon": "EditFilled",
                        "eventInfo": {
                          "eventId": "userManagementManageScreen",
                          "queryKey": "userManagementManageScreen",
                          "data_bind": ["paysetEditCode"],
                          "path": "cgsgql/Hrpsaas",
                          "handler": "REST",
                          "method": "QUERY",
                          "action": "click",
                          "query": {
                            "path": "./getAllGQL.ts",
                            "callBack": "getAllGQLEvent"
                          }
                        }
                      },
                      {
                        "code": "del",
                        "desc": "Delete User",
                        "icon": "DeleteFilled",
                        "eventInfo": {
                          "eventId": "userManagementDeleteScreen",
                          "queryKey": "userDelete_mutation",
                          "confirmation": {
                            "confirmationType": "deleteConfirmation",
                            "message":
                                "Are you sure that you want to Delete this User?",
                            "id": "deleteUserConfirmation"
                          },
                          "data_bind": ["Username"],
                          "path": "cgsgql/Hrpsaas",
                          "handler": "REST",
                          "method": "DELETE",
                          "refreshQueryKey": "userManagementScreen",
                          "query": {
                            "path": "paySetDelete_mutation",
                            "callBack": "paySetDelete_mutation"
                          },
                          "response": {
                            "responseAction": "Alert",
                            "statusField": "paysetAttributesStatusOut",
                            "bind": {
                              "path":
                                  "data.paysetAttribute.paysetAttributesStatusOut",
                              "queryName": "paysetAttribute",
                              "operationId": "",
                              "customPath1": "",
                              "customPath2": ""
                            },
                            "success": {"message": "User deleted successfully"},
                            "error": {"message": "Error deleting user"}
                          }
                        }
                      }
                    ],
                    "className": ""
                  }
                },
                "body": {
                  "className": "wd-100",
                  "children": [
                    {
                      "controlType": "label",
                      "id": "Userdescription",
                      "type": "para",
                      "className": "font-s grey2 mb-one-s"
                    },
                    {
                      "controlType": "label",
                      "id": "Email",
                      "type": "para",
                      "className": "font-s grey2"
                    }
                  ]
                },
                "footer": {"children": []}
              }
            ],
            "bindInfo": {
              "path": "data.data",
              "queryName": "data",
              "operationId": "",
              "customPath1": "",
              "customPath2": ""
            },
            "eventInfo": {
              "eventId": "userManagementScreen",
              "queryKey": "userManagementScreen",
              "data_bind": ["no-bind"],
              "onLoad": {
                "path": "coreapiops/v1/users",
                "headers": {},
                "params": {},
                "handler": "REST",
                "method": "GET",
                "response": {
                  "bindInfo": {
                    "path": "data.data",
                    "queryName": "data",
                    "operationId": "",
                    "customPath1": "",
                    "customPath2": ""
                  },
                }
              },
            }
          }
        ]
      },
    ]
  };
  @override
  State<PageRenderer> createState() => _PageRendererState();
}

class _PageRendererState extends State<PageRenderer> {
  List<BootstrapCol> pageChildren = [];

  dynamic renderPage() {
    for (var control in widget.metaData['children']!) {
      // print('Page:${control}');
      pageChildren.add(BootstrapCol(
          sizes: buildLayoutColumn(control),
          child: ControlRenderer(
            controlInfo: control,
            apiClient: widget.apiClient,
          )));
    }
    return pageChildren;
  }

  @override
  Widget build(BuildContext context) {
    return BootstrapRow(
      // mainAxisAlignment: MainAxisAlignment.start,
      // children: [Text('hellp')],
      children: renderPage(),
    );
  }
}
