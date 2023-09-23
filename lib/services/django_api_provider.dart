import 'dart:convert';

import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      final header = {'Authorization': 'token ${_user?.token}'};
      final url = Uri.http(baseURL, userPath);
      final response = await _client.delete(url, headers: header);

      final preference = await SharedPreferences.getInstance();
      await preference.remove('token');
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
      final urlpath = Uri.http(baseURL, blogContantPath);

      final response = await _client.post(urlpath, body: {'url': url});
      final List jsondata = jsonDecode(response.body);
      return jsondata.map((item) => ContantItem.fromMap(item));
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<BlogList> getBloglist(String? url) async {
    try {
      final urlpath = Uri.http(
        baseURL,
        bloglistPath,
      );
      final response = await _client.post(urlpath, body: {'url': url});
      final jsondata = jsonDecode(response.body);

      return BlogList.fromMap(jsondata);
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<Iterable<BlogList>> getHomeBlog() async {
    final url = Uri.http(
      baseURL,
      bloglistPath,
    );
    final response = await _client.get(url);
    final List jsondata = jsonDecode(response.body);

    return jsondata.map((item) => BlogList.fromMap(item));
  }

  @override
  Future<Iterable<MenuItem>> getCareerlist() async {
    try {
      final url = Uri.http(baseURL, currierlistPath);
      final response = await _client.get(url);
      final List jsondata = jsonDecode(response.body);

      return jsondata.map<MenuItem>((item) => MenuItem.fromMap(item));
    } on Exception {
      throw GenericAPICallException();
    }
  }

  @override
  Future<void> initialise() async {
    try {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString('token');
      if (token != null) {
        final header = {'Authorization': 'token $token'};

        final url = Uri.http(baseURL, userPath);
        final response = await _client.get(url, headers: header);

        if (response.statusCode == 200) {
          final jsondata = jsonDecode(response.body);
          _user = APIUser.fromjson(jsondata, token);
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
        userNameField: userName,
        passwordField: password,
      };
      final url = Uri.http(baseURL, loginPath);
      final response = await _client.post(url, body: body);
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        _user = APIUser.fromjson(jsondata[payloadField], jsondata[tokenfield]);

        final preference = await SharedPreferences.getInstance();
        await preference.setString('token', jsondata[tokenfield]);
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
      final url = Uri.http(baseURL, registerPath);
      final response = await _client.post(url, body: body);
      if (response.statusCode == 200) {
        final jsonbody = jsonDecode(response.body);
        _user = APIUser.fromjson(jsonbody[payloadField], jsonbody[tokenfield]);

        final preference = await SharedPreferences.getInstance();
        await preference.setString('token', jsonbody[tokenfield]);
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
      final body = {passwordField: password};
      final header = {'Authorization': 'token ${_user?.token}'};

      final url = Uri.http(baseURL, userPath);
      final response = await _client.put(url, body: body, headers: header);
      if (response.statusCode != 200) {
        throw UnableToChangeUserAPIException();
      }
    } on Exception {
      throw GenericAPICallException();
    }
  }
}
