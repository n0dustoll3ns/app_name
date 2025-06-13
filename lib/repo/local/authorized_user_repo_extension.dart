import 'dart:convert';

import 'package:app_name/domain/user.dart';
import 'package:app_name/repo/local/local_repository.dart';

extension AuthUserExtension on LocalRepository {
  String get _key => 'authUser';
  Future<User?> getAuthorizedUser() async {
    final encoded = await read(_key);
    return encoded != null ? User.fromJson(jsonDecode(encoded)) : null;
  }

  Future<void> saveAuthorizedUser(User? data) async {
    if (data != null) {
      (await prefs).setString(_key, jsonEncode(data.toJson()));
    } else {
      (await prefs).remove(_key);
    }
  }
}
