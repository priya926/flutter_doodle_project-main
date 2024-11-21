import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:doodle_shree/models/user.model.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static Future<bool> islogin() async {
    return await APICacheManager().isAPICacheKeyExist("Login");
  }

  static Future<void> deleteuser() async {
    await APICacheManager().deleteCache("Login");
  }

  static Future<UserModel?> getuser() async {
    final user = await APICacheManager().getCacheData("Login");
    if (user.key.isNotEmpty) {
      final cachedata = await APICacheManager().getCacheData("Login");
      return UserModel.fromJson(jsonDecode(cachedata.syncData));
    }
    return null;
  }

  static Future<void> setlogin(UserModel userModel) async {
    if (kDebugMode) {
      print(userModel.toString());
    }
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "Login",
      syncData: jsonEncode(
        userModel.toJson(),
      ),
    );
    await APICacheManager().addCacheData(cacheDBModel);
  }
}
