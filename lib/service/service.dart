import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_details/helpers/error_handling.dart';
import 'package:movie_details/helpers/refactoring.dart';
import 'package:movie_details/model/hive_model.dart';
import 'package:movie_details/model/request.dart';
import 'package:movie_details/model/response.dart';

class MovieService {
  static final Dio dio = Dio();
  static final List<UserModel> noteModelList = [];
  static Future<ResponseModel?> postMethord(
      {required RequestModel model}) async {
    try {
      final Response response = await dio.post(url, data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return ResponseModel.fromJson(response.data);
      }
    } catch (e) {
      ErrorHandlers.errorHandler(e);
    }
    return null;
  }

  static Future<void> userAdd(UserModel model) async {
    final dB = await Hive.openBox<UserModel>('userDb');
    await dB.add(model);
  }

  static Future<List<UserModel>> getAllUser() async {
    final dB = await Hive.openBox<UserModel>('userDb');
    return dB.values.toList();
  }
}
