// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:casheing_and_local_storage/model/handle_model.dart';
import 'package:casheing_and_local_storage/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Dio dio;
  late Response response;
  String baseUrl = "https://jsonplaceholder.typicode.com/users/1";
  UserModel? user;
  UserService({
    required this.dio,
  });

  Future<Object> getUserProfile() async {
    try {
      if (user == null) {
        log("------------------From NetWork---------------");
        response = await dio.get(baseUrl);

        user = UserModel.fromMap(response.data);
        // bool status =
        //     await sl.get<SharedPreferences>().setString("user", user!.toJson());
        // log(status.toString());
        return user!;
      } else {
        log("-------------From Cash------------");
        // ! add cashing for service layer
        return user!;
      }
    } catch (e) {
      // print(e);
      // if (sl.get<SharedPreferences>().getString("user")!.isNotEmpty) {
      //   return UserModel.fromJson(
      //       sl.get<SharedPreferences>().getString("user")!);
      // } else {
        return HandleModel(message: "There is No Data");
      // }
    }
  }
}
