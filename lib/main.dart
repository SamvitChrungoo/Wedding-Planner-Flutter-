import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:my_app/Home.dart';
import 'Widgets/Animatedlogo.dart';


void main() => runApp(MaterialApp(
  theme: new ThemeData(primarySwatch: Colors.red),
  home:  SplashScreen(),  
));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
    Animation<double> animation;            
  AnimationController controller; 
  @override
  void initState() {
    super.initState();
      controller =AnimationController(duration: const Duration(seconds: 2), vsync: this);            
  animation = Tween<double>(begin: 0.0, end: 100.0).animate(controller);      

   controller.forward();            

    Timer(
        Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home())));
  }

  @override
void dispose() {            
controller.dispose();            
super.dispose();            
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.redAccent,gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.55, 0.3, 0.5, 0.7,0.8,0.9],
          colors: [
            Colors.red[700],
            Colors.red[600],
            Colors.red[500],
            Colors.red[400],
            Colors.red[300],
              Colors.red[200],
          ],
        ),)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                   Animatedlogo(animation: animation),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Event Planner", style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: CircularProgressIndicator (backgroundColor: Colors.white,),
                    ) ,

                    Text('Manage Events with Ease....',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500))
                  ],
                ),
              ),

            ],
          ),
        ],
      )
      );
  }
}
