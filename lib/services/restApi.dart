dynamic prepareApiResponse(response, bindInfo) {
  // print("${bindInfo}  ${response}  --- ${bindInfo}");
  if (bindInfo['queryName'].toString().isNotEmpty) {
    response = response[bindInfo['queryName']];
  }
  if (bindInfo['operationId'].toString().isNotEmpty) {
    response = response[bindInfo['operationId']];
  }
  if (bindInfo['customPath1'].toString().isNotEmpty) {
    response = response[bindInfo['customPath1']];
  }
  if (bindInfo['customPath2'].toString().isNotEmpty) {
    response = response[bindInfo['customPath2']];
  }
  // print("hello ${response}");
  return response;
}

dynamic doRestApiAction(eventInfo, widget) {
  switch (eventInfo["method"].toString().toLowerCase()) {
    case 'get':
      dynamic response = widget.apiClient.get(eventInfo['path'], headers: {
        'context-ou-id': '1',
        'context-lang-id': '1',
        'context-role-name': 'adminrole',
      });
      return response;
      break;
    case 'post':
    case 'put':
    case 'patch':
      print('method not implemented');

      break;
    default:
      throw ('Method Not implemented');
  }
}

String constructRestApiUrl(String givenPath, data, dataBind) {
  for (var bindInfo in dataBind) {
    if (bindInfo["destination"] == "url")
      givenPath.replaceAll(":" + bindInfo["id"], data[bindInfo["id"]]);
  }

  return givenPath;
}
