import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dbClientProvider = Provider<DbClient>((ref) {
  return DbClient();
});

enum LocalDataType { boolean, integer, string }
class DbClient {
 static initialize() async {  WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferences.getInstance();
  }

  removeData({required String dbKey}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(dbKey);
  }

 setData({
    required LocalDataType dataType,
    required String dbKey,
    required var value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    dataType == LocalDataType.boolean
        ? prefs.setBool(dbKey, value)
        : dataType == LocalDataType.integer
            ? prefs.setInt(dbKey, value)
            : prefs.setString(dbKey, value);
  }
  getData({required String dbKey, required LocalDataType dataType}) async {
    final prefs = await SharedPreferences.getInstance();

    final result = dataType == LocalDataType.boolean
        ? prefs.getBool(dbKey)
        : dataType == LocalDataType.integer
            ? prefs.getInt(dbKey)
            : prefs.getString(dbKey);

    return result;
  }


  reset() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
