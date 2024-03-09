import 'dart:convert';

import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/models/models.dart';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';
import 'api_provider.dart';

class DjangoAPIDataProvider implements APIDataProvider {
  APIUser? _user;

  final _client = http.Client();

  factory DjangoAPIDataProvider() => _shared;
  static final _shared = DjangoAPIDataProvider.getInstance();
  DjangoAPIDataProvider.getInstance();

  @override
  APIUser? get currentuser => _user;

  @override
  Future<void> deleteUser() async {
    try {
      final header = {
        AppConstants.authorization:
            AppConstants.getAuthorizationValue(currentuser?.token)
      };
      final url = Uri.http(AppConstants.baseURL, AppConstants.userPath);
      final response = await _client.delete(url, headers: header);
      await AppMethods.deleteToken();
      _user = null;
      if (response.statusCode != 200) {
        throw UnableToDeleteUserAPIException();
      }
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<Iterable<ContantItem>> getBlogcontant(String? url) async {
    try {
      final urlpath =
          Uri.http(AppConstants.baseURL, AppConstants.blogContantPath);

      final response =
          await _client.post(urlpath, body: {AppConstants.url: url});
      return AppMethods.transformJsonToContentItem(response.body);
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<BlogList> getBloglist(String? url) async {
    try {
      final urlpath = Uri.http(AppConstants.baseURL, AppConstants.bloglistPath);
      final response =
          await _client.post(urlpath, body: {AppConstants.url: url});
      return AppMethods.transformJsonToBlogList(response.body);
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<Iterable<BlogList>> getHomeBlog() async {
    final url = Uri.http(AppConstants.baseURL, AppConstants.bloglistPath);
    final response = await _client.get(url);
    return AppMethods.transformJsonToItrableBlogList(response.body);
  }

  @override
  Future<Iterable<MenuItem>> getCareerlist() async {
    try {
      final url = Uri.http(AppConstants.baseURL, AppConstants.currierlistPath);
      final response = await _client.get(url);
      return AppMethods.transformJsonToItrableMenuItem(response.body);
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<void> initialise() async {
    try {
      final token = await AppMethods.getToken();
      if (token != null) {
        final header = {
          AppConstants.authorization: AppConstants.getAuthorizationValue(token)
        };

        final url = Uri.http(AppConstants.baseURL, AppConstants.userPath);
        final response = await _client.get(url, headers: header);

        if (response.statusCode == 200) {
          _user = AppMethods.transformJsonToAPIUser(response.body, token);
        }
      }
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<APIUser?> login(
      {required String userName, required String password}) async {
    try {
      final body = {
        AppConstants.userNameField: userName,
        AppConstants.passwordField: password,
      };
      final url = Uri.http(AppConstants.baseURL, AppConstants.loginPath);
      final response = await _client.post(url, body: body);
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        _user = APIUser.fromjson(jsondata[AppConstants.payloadField],
            jsondata[AppConstants.tokenfield]);
        await AppMethods.setToken(jsondata);
        return _user;
      } else if (response.statusCode == 404) {
        throw InvalidCredentialsAPIException();
      } else {
        throw UnableToLoginUserAPIException();
      }
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<APIUser?> register(Map<String, Object?> body) async {
    try {
      final url = Uri.http(AppConstants.baseURL, AppConstants.registerPath);
      final response = await _client.post(url, body: body);
      if (response.statusCode == 200) {
        final jsonbody = jsonDecode(response.body);
        _user = APIUser.fromjson(jsonbody[AppConstants.payloadField],
            jsonbody[AppConstants.tokenfield]);
        await AppMethods.setToken(jsonbody);
        return _user;
      } else if (response.statusCode == 400) {
        throw UnableToRegesterUserAPIException();
      } else {
        throw GenericAPICallException();
      }
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<void> updatePassword(String password) async {
    try {
      final body = {AppConstants.passwordField: password};
      final header = {
        AppConstants.authorization:
            AppConstants.getAuthorizationValue(currentuser?.token)
      };

      final url = Uri.http(AppConstants.baseURL, AppConstants.userPath);
      final response = await _client.put(url, body: body, headers: header);
      if (response.statusCode != 200) {
        throw UnableToChangeUserAPIException();
      }
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await AppMethods.deleteToken();
      await AppMethods.getToken();
      _user = null;
    } on Exception {
      throw GenericAPICallException();
    }
  }
}
