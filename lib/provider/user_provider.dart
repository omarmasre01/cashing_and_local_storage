import 'package:casheing_and_local_storage/config/service_locater.dart';
import 'package:casheing_and_local_storage/model/handle_model.dart';
import 'package:casheing_and_local_storage/model/user_model.dart';
import 'package:casheing_and_local_storage/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ! 1-StateManagment : output : DataEntity

// ?-1.5 UseCase
class UserProvider extends ChangeNotifier {
  UserService userService = UserService(dio: Dio());
  ResultModel pureData = ResultModel();

  void getProfile() async {
    var box = await Hive.openBox('testBox');

    print(pureData.runtimeType);
    if (await InternetConnectionChecker.instance.hasConnection) {
      // ! 3-Remote Repository : DataModel
      var result = await userService.getUserProfile();

      // Check if the result is of type ResultModel
      if (result is ResultModel) {
        pureData = result;
        // sl.get<SharedPreferences>().setString(
        //       "newUser",
        //       (pureData as UserModel).toJson(),
        //     );

        await box.put('user', pureData);
        var retrievedUser = box.get('user') as UserModel;
        print(retrievedUser.email);
      } else {
        // Handle the case where the result is not of the expected type
        pureData = HandleModel(
          message: "Unexpected result type: ${result.runtimeType}",
        );
      }
    } else {
      // ! 4-Local Repository : DataModel
      if (box.get('user') == null) {
        pureData = HandleModel(
          message: "The Shared Preferences is Empty",
        );
      } else {
        pureData = box.get('user') as UserModel;
      }
    }
    notifyListeners();
  }
}
