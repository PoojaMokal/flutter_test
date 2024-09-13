import 'dart:convert';

import 'package:meui_project/app_constants/api_path.dart';
import 'package:meui_project/utils/api_methods.dart';

class AuthRepo {
  final API _api = API();

  Future loginUser(Map payLoad) async {
    final response = await _api.postMethod(ApiPath.loginUser, payLoad);

    Map<String, dynamic> map = (jsonDecode(response.body));

    var data = map['data'];

    // if (data != null) {
    //   return SuperResponse.fromJson(map, UserData.fromJson(data));
    // } else {
    //   return SuperResponse.fromJson(map, null);
    // }
  }

  Future registerUser(Map payLoad) async {
    final response = await _api.postMethod(ApiPath.registerUser, payLoad);

    Map<String, dynamic> map = (jsonDecode(response.body));

    // var data = map['data'];

    return map;

    // if (data != null) {
    //   return SuperResponse.fromJson(map, UserData.fromJson(data));
    // } else {
    //   return SuperResponse.fromJson(map, null);
    // }
  }
}
