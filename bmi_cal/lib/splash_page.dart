import 'dart:async';

import 'package:bmi_cal/IntroPage.dart';
import 'package:bmi_cal/login_page.dart';
import 'package:bmi_cal/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SplashScreenPage();
}

class SplashScreenPage extends State<SplashPage>{
  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();

    whereToGo();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffaccbee) ,Color(0xffe7f0fd)
                ],

              )
          ),

        width: double.infinity,
        height: double.infinity,

       child: Container(
         child: CircleAvatar(
           backgroundColor: Colors.indigo,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('BODY' , style: TextStyle(fontSize: 40, color: Colors.white , fontWeight: FontWeight.w500),),
                Text('MASS' , style: TextStyle(fontSize: 40, color: Colors.white , fontWeight: FontWeight.w500),),
                Text('INDEX' , style: TextStyle(fontSize: 40, color: Colors.white , fontWeight: FontWeight.w500),),
           
              ],
            ),
         ),
       )
      ),

    );
  }

  void whereToGo() async {

    var sharedpref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedpref.getBool(KEYLOGIN);

    sharedpref.setBool(KEYLOGIN, false);

    Timer(Duration(seconds: 2), () {

      if(isLoggedIn !=null){
        if(isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(sharedpref.getString(LoginPage.KEYNAME))));
        }
        else{
          Navigator.pushReplacement(context , MaterialPageRoute(builder: (context) => LoginPage(),));
        }
      }
      else{
        Navigator.pushReplacement(context , MaterialPageRoute(builder: (context) => LoginPage(),));
      }
    });

  }

}