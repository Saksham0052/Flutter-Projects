import 'package:bmi_cal/login_page.dart';
import 'package:bmi_cal/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text('WELCOME')),
      ),
      body: Container(

        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xffaccbee) ,Color(0xffe7f0fd),
              ],
              center: Alignment.bottomLeft

            )
        ),
        // color: Colors.indigo.shade200,


        child: Center(
          child: Container(
            // color: Colors.indigo.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text ('Lets get started!', style: TextStyle(fontSize: 34 , fontWeight: FontWeight.bold , color: Colors.indigo.shade700),),
             SizedBox(
               height: 15,
             ),
              ElevatedButton(onPressed: (){

               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text('Start'  , style: TextStyle(fontSize: 25, color: Colors.indigo.shade400),))
              ],
            ),
          ),
        ),
      ),
    );
  }


}