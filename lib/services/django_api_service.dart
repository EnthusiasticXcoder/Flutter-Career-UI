import 'package:fluttercareerui/models/models.dart';
import 'package:fluttercareerui/services/service.dart';

class DjangoAPIservice implements APIDataProvider {
  final APIDataProvider provider;
  DjangoAPIservice(this.provider);

  factory DjangoAPIservice.fromBackend() =>
      DjangoAPIservice(DjangoAPIDataProvider());

  @override
  get currentuser => provider.currentuser;

  @override
  Future<void> deleteUser() => provider.deleteUser();

  @override
  Future<Iterable<ContantItem>> getBlogcontant(String? url) =>
      provider.getBlogcontant(url);

  @override
  Future<BlogList> getBloglist(String? url) => provider.getBloglist(url);

  @override
  Future<Iterable<MenuItem>> getCareerlist() => provider.getCareerlist();

  @override
  Future<Iterable<BlogList>> getHomeBlog() => provider.getHomeBlog();

  @override
  Future<void> initialise() => provider.initialise();

  @override
  Future<APIUser?> login(
          {required String userName, required String password}) =>
      provider.login(userName: userName, password: password);

  @override
  Future<APIUser?> register(Map<String, Object?> body) =>
      provider.register(body);

  @override
  Future<void> updatePassword(String password) =>
      provider.updatePassword(password);
}
