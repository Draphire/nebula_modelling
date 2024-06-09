// class MetadataType {
//   // Define the structure of MetadataType based on your requirements
//   final dynamic children;

//   MetadataType({required this.children});
// }

// {
//     "queries": {},
//     "components": {
// "ID1713519951416271": {
//     "value": "Hellodadasddsaddcr"
// },
//         "ID171351995652011": {}
//     },
//     "globals": {
//         "theme": {
//             "name": "light"
//         },
//         "urlparams": null
//     },
//     "application": {
//         "id": null,
//         "name": null,
//         "description": null
//     },
//     "errors": {},
//     "variables": {},
//     "client": {},
//     "server": {},
//     "page": {
//         "handle": "",
//         "variables": {}
//     },
//     "modal": {
//         "show": false,
//         "component": null
//     },
//     "succededQuery": {},
//     "actions": {}
// }
class PageMetadata {
  dynamic metaData;
  String pageId;
  dynamic layoutDetails;
  String? modalPageId;
  dynamic pagePrerequisiteVariables;

  PageMetadata({
    required this.metaData,
    required this.pageId,
    required this.layoutDetails,
    this.modalPageId,
    this.pagePrerequisiteVariables,
  });
}
