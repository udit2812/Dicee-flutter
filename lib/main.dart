import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center
          (child: Text('DICES',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
          ),
          )
          ),
          backgroundColor: Colors.red[900],
        ),
        body:
        Center(
          child: Container(
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage('images/wood.jpg'),
              fit:BoxFit.cover,
              ),
               
               ),           
          child: DicePage(),
),  
      ),
    ),
    ),
    );
}

class DicePage extends StatefulWidget {
  
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  ShakeDetector detector;
  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      changeDiceFace();
    });
        // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  int leftdicenumber=2;
  int rightdicenumber=6;
  
  void changeDiceFace() {
    setState(() {
              leftdicenumber=Random().nextInt(6)+1;
              rightdicenumber=Random().nextInt(6)+1 ;
            });
  }
    @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                onPressed: (){},
                child: Image.asset('images/dice$leftdicenumber.png'),
                ),
                ),
                Expanded(child: TextButton(
                  onPressed: (){},
                  child: Image.asset('images/dice$rightdicenumber.png'),
                ),
                ),
              ],
            ),
          ),
          
          // Container(
          // padding: EdgeInsets.all(10.0),
          //       child:  Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //         Center(
          //           child: OutlinedButton(
          //             style: OutlinedButton.styleFrom(
          //               onSurface: Colors.green,
          //               shadowColor: Colors.black12,
          //               primary:Colors.black,
          //             ),
          //             onPressed: (){ 
          //             changeDiceFace();
          //           }, 
          //           child: Text('ROLL THE DICE',
          //           style: TextStyle(
          //             fontSize:18.0,
          //             fontWeight: FontWeight.bold,
          //           ),
          //           ),                    
          //           ),
          //         )
          //       ],),
          //     ),
        ],
      ),
    );
}

}