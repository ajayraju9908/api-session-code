import 'package:assigned_task/models/get/login_response_model.dart';
import 'package:assigned_task/models/post/login_post_model.dart';
import 'package:assigned_task/repositories/login_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider with ChangeNotifier {

   bool _isLoading = false;
   bool get isLoading => _isLoading;

   LoginResponseModel? _loginResponseModel;
   LoginResponseModel? get loginResponseModel => _loginResponseModel;



   Future<void> login({required LoginPostModel loginPostModel,required VoidCallback successCallback,required VoidCallback failedCallBack}) async {
     _isLoading = true;
    notifyListeners();

         await Future.delayed(const Duration(seconds: 1));
         notifyListeners();


   final repo = LoginRepository();
    final results = await repo.login(loginPostModel: loginPostModel);
    results.fold((l) {
      _isLoading = false;
      notifyListeners();
      failedCallBack();
    }, (r) {
       _isLoading = false;
      notifyListeners();
      successCallback();
    });
    

     
   
    


   }
}