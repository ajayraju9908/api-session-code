import 'package:assigned_task/common/common_button.dart';
import 'package:assigned_task/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? tokenvalue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 WidgetsBinding.instance.addPostFrameCallback((_) async {
     final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    
    if (token != null) {
      tokenvalue = token;
    } else {
      // Fluttertoast.showToast(msg: 'No token found');
    }
   
  }


 );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashbaord Page"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("your token value is ${tokenvalue}"),
              ),
              SizedBox(
                height: 20,
              ),
              CommonButton(
                  voidCallback: () async {
                    final SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.clear();
                    Fluttertoast.showToast(
                        msg: 'All sessions cleared',
                        backgroundColor: Colors.greenAccent,
                        textColor: Colors.white);
                    await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (c) => LoginScreen()),
                        (r) => false);
                  },
                  title: "Clear All Sessions Token")
            ],
          ),
        ),
      ),
    );
  }
}
