import 'package:bmi_cal/main.dart';
import 'package:bmi_cal/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget{
  var nameController = TextEditingController();
  var dobController = TextEditingController();
  static var nameFromLogin;
  static const String KEYNAME = "name";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Enter your details'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xffaccbee) ,Color(0xffe7f0fd)
              ],

            )
        ),
        // color: Colors.indigo.shade200,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo.shade50,
                            width: 2
                      )
                    )  ,
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                            width: 2
                      )
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                TextField(
                  controller: dobController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.indigo.shade50,
                              width: 2
                          )
                      )  ,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.indigo.shade900,
                              width: 2
                          )
                      ),
                    prefixIcon: Icon(Icons.cake),
                    suffix: InkWell(
                      onTap: () async{
                        DateTime? datePicked  = await showDatePicker(context: context,
                            firstDate: DateTime(2004),
                            lastDate: DateTime(2025),
                        );
                      },
                    child: Icon(Icons.arrow_downward, color: Colors.indigo.shade700,)
                    ),

                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                ElevatedButton(onPressed: () async {
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(SplashScreenPage.KEYLOGIN , true);

                  sharedPref.setString(KEYNAME, nameController.text.toString());

                  // While using sharedpref , database , api , we are not sure that how much time will it take
                  // which will hold the ui
                  // so we make it asynchronas(asyn). 

                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(sharedPref.getString(KEYNAME))));
                }, child: Text('Login'  , style: TextStyle(fontSize: 25, color: Colors.indigo.shade400),))
              ],
            ),
          ),
        ),
      ),


    );

  }

}
