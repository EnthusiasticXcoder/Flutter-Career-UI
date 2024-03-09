import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'app_constant.dart';

class AppMethods {
  static Future<String?> getToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(AppConstants.tokenfield);
  }

  static Future<void> deleteToken() async {
    final preference = await SharedPreferences.getInstance();
    await preference.remove(AppConstants.tokenfield);
  }

  static Iterable<ContantItem> transformJsonToContentItem(String body) {
    final List jsondata = jsonDecode(body);
    return jsondata.map((item) => ContantItem.fromMap(item));
  }

  static BlogList transformJsonToBlogList(String body) {
    final jsondata = jsonDecode(body);
    return BlogList.fromMap(jsondata);
  }

  static Iterable<BlogList> transformJsonToItrableBlogList(String body) {
    final List jsondata = jsonDecode(body);
    return jsondata.map((item) => BlogList.fromMap(item));
  }

  static Iterable<MenuItem> transformJsonToItrableMenuItem(String body) {
    final List jsondata = jsonDecode(body);
    return jsondata.map<MenuItem>((item) => MenuItem.fromMap(item));
  }

  static APIUser? transformJsonToAPIUser(String body, String token) {
    final jsondata = jsonDecode(body);
    return APIUser.fromjson(jsondata, token);
  }

  static Future<void> setToken(jsondata) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(
        AppConstants.tokenfield, jsondata[AppConstants.tokenfield]);
  }
}
