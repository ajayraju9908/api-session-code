import 'dart:developer';

import 'package:assigned_task/constants/constants.dart';
import 'package:assigned_task/constants/endpoints.dart';
import 'package:assigned_task/models/get/login_response_model.dart';
import 'package:assigned_task/models/post/login_post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  // INITIALIZING DIO
  final dioClient = Dio();
 

  // LOGIN API
  Future<Either<String,LoginResponseModel>> login(
      {required LoginPostModel loginPostModel}) async {

   
    log('LOGIN API STARTED');
    String url = Endpoints.loginUrl;
    try {
      final response = await dioClient.post(url, data: loginPostModel.toJson());

        log("responce body code 200 ${loginPostModel.toJson().toString()}");

      if (response.statusCode == 200) {
        log('LOGIN API SUCCESS');
      
        final data = response.data;
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(data);

            final SharedPreferences prefs = await SharedPreferences.getInstance();

           await prefs.setString(Constatns.token, loginResponseModel.token.toString());

        return right(loginResponseModel);
      } else {
        
        log('LOGIN API FAILED');
        return  left("Login Api Failed");
      }
    } catch (e) {
      log('LOGIN API FAILED');
        return  left("Login Api Failed");
    }
  }
}
