import 'package:assigned_task/common/common_button.dart';
import 'package:assigned_task/common/common_textfield.dart';
import 'package:assigned_task/constants/constants.dart';
import 'package:assigned_task/models/post/login_post_model.dart';
import 'package:assigned_task/provider/login_provider.dart';
import 'package:assigned_task/repositories/login_repository.dart';
import 'package:assigned_task/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
void initState()  {
  super.initState();
  

  WidgetsBinding.instance.addPostFrameCallback((_) async {
     final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    
    if (token != null) {
      await Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (c) => const DashboardScreen())
      );
    } else {
      // Fluttertoast.showToast(msg: 'No token found');
    }
   
  });
}


  // INITIALZING CONTROLLER FOR TEXTFIELDS

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

 


// DISPOSE
@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
        'Login Screen',
        style: TextStyle(color: Colors.white),
      ),centerTitle: true,),
      body: SafeArea(child: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
          SizedBox(height: size.height * 0.1,),

            SizedBox(height: size.height * 0.03,),
             Text("\n"),
             Text("Email = eve.holt@reqres.in"),
             Text("Password = cityslicka"),
              SizedBox(height: size.height * 0.1,),
          // EMAIL FIELD
          CommonTextFieldWidget(textEditingController: _emailController, textInputType: TextInputType.emailAddress, textInputAction: TextInputAction.next, hintText: 'youremail@gmail.com',),
          SizedBox(height: size.height * 0.02,),
          // PASSWORD FIELD
          
          CommonTextFieldWidget(textEditingController: _passwordController, textInputType: TextInputType.visiblePassword, textInputAction: TextInputAction.done, hintText: '***',),
           SizedBox(height: size.height * 0.03,),
          
          // LOGIN BUTTON
      context.watch<LoginProvider>().isLoading == true ? const Center(child: CircularProgressIndicator(color: Colors.blue,strokeAlign: 2,),)  :   CommonButton(voidCallback: () async {
          if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
            LoginPostModel loginPostModel = LoginPostModel(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim()
            );
            await context.read<LoginProvider>().login(loginPostModel: loginPostModel, successCallback: ()async  { 
              Fluttertoast.showToast(msg: "Login successfull");
              if(context.mounted) {
                // NAVIGATING TO DASHBAORD PAGE
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => DashboardScreen()), (r) => false);
              }

             },failedCallBack: () {
              Fluttertoast.showToast(msg: 'Login Failed,please try again');

            });
            // CALLING LOGIN API
          }else {
            Fluttertoast.showToast(msg: 'Please enter both email and password',backgroundColor: Colors.red,textColor: Colors.white);
          }
          }, title: "Login"),
           
        ],),
      ),),),
      
    );
  }

}