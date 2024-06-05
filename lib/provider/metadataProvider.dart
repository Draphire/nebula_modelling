import 'package:flutter/material.dart';
import 'package:nebula_modelling/model/pageMetaData.dart';

class MetadataProvider with ChangeNotifier {
  PageMetadata _pageMetadata = PageMetadata(
    metaData: {
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
          "controlType": "label",
          "caption": "User Management",
          "type": "h1",
          "layout": {
            "colLayout": {
              "xl": 6,
              "lg": 6,
              "md": 6,
              "sm": 8,
              "xs": 8,
            },
            "spacing": {"mb": 2, "mt": 2}
          }
        },
        {
          "controlType": "button",
          "caption": "Add",
          "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
          "layout": {
            "colLayout": {
              "xl": 12,
              "lg": 12,
              "md": 4,
              "sm": 4,
              "xs": 4,
            }
          }
        },
        {
          "controlType": "textfield",
          "caption": "Search",
          "placeholder": "Search user",
          "id": "search",
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
          "controlType": "textfield",
          "caption": "Username",
          "placeholder": "username",
          "id": "Username",
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
          "controlType": "textfield",
          "caption": "Userdescription",
          "placeholder": "User description",
          "id": "Userdescription",
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
          "controlType": "textfield",
          "caption": "Email",
          "placeholder": "Email",
          "id": "Email",
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
          "caption": "Add",
          "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
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
      ]
    },
    pageId: "initialPageId",
    layoutDetails: {},
  );

  PageMetadata get pageMetadata => _pageMetadata;

  void setPageMetadata(PageMetadata newPageMetadata) {
    _pageMetadata = newPageMetadata;
    notifyListeners();
  }
}
