// class MetadataType {
//   // Define the structure of MetadataType based on your requirements
//   final dynamic children;

//   MetadataType({required this.children});
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
