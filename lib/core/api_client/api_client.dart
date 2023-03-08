import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_const.dart/api_const.dart';
import '../api_exception/api_exception.dart';
import '../db_client.dart';

class ApiClient {
  final DbClient dbClient;
  ApiClient(this.dbClient);
  Future request(
      {required String path,
      String type = "get",
      Map<String, dynamic> data = const {},
      String token = ""}) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.kbaseUrl,
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
        },
      ),
    );
    try {
      final result = type == "get"
          ? await dio.get(path)
          : await dio.post(path, data: data);
      return result.data;
    } on DioError catch (e) {
      log(e.response!.statusCode.toString());
      log(e.response!.toString());
      log(e.message.toString());
      log(e.type.toString());
      throw DioException.fromDioError(e);
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.read(dbClientProvider));
});
