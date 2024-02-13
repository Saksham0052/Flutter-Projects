
import 'package:bmi_cal/IntroPage.dart';
import 'package:bmi_cal/login_page.dart';
import 'package:bmi_cal/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch:
        Colors.indigo,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  final nameFromLogin ;
  MyHomePage(this.nameFromLogin);

  @override
  State<StatefulWidget> createState() => _MyHomePage(nameFromLogin);
}

class _MyHomePage extends State<MyHomePage>{
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var _nameFromLogin ;
  _MyHomePage(this._nameFromLogin);


  var nameValue;
  var result;
  var bgColor = Colors.indigo.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:  Text('Hi , $_nameFromLogin'),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
         Color(0xffaccbee) ,Color(0xffe7f0fd)
            ],
            begin: FractionalOffset(0.0 , 1.0) ,
            end: FractionalOffset(1.0 , 0.0),
          )
        ),
        // color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.indigo.shade50,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.indigo.shade900,
                              width: 2
                          )
                      ),
                    label: Text('Enter your weight(in kg)'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo.shade50,
                        width: 2
                      )
                    ),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                        width: 2
                      )
                    ),
                    label: Text('Enter your height(in feet)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.indigo.shade50,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.indigo.shade900,
                              width: 2
                          )
                      ),
                    label: Text('Enter your height(in inches'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!= "" && inch!= ""){
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                    var msg = "";

                    if(bmi<18){
                      msg = 'You are Underweight!';
                    } else if(bmi>25){
                      msg = 'You are Overweight!';
                    } else {
                      msg = 'You are Healthy!';
                    }
                    setState(() {
                      result = ' $msg \n Your bmi is: ${bmi.toStringAsFixed(3)}';
                    });
                  }
                  else{
                    setState(() {
                      result = 'Please fill all required blanks';
                    });
                  }



                }, child: Text('Calculate' , style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
                Text('RESULT : $result', style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),
    );
  }


}



