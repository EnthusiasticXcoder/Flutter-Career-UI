
import 'package:fluttercareerui/models/models.dart';

abstract class APIDataProvider {
  APIUser? get currentuser;
  Future<APIUser?> register(Map<String, Object?> body);

  Future<APIUser?> login({required String userName, required String password});

  Future<void> updatePassword(String password);

  Future<void> deleteUser();

  Future<void> initialise();

  Future<Iterable<MenuItem>> getCareerlist();

  Future<BlogList> getBloglist(String? url);
  Future<Iterable<ContantItem>> getBlogcontant(String? url);
  Future<Iterable<BlogList>> getHomeBlog();
}
