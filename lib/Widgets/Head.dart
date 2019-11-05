import 'package:flutter/material.dart';
import 'RotatedLogo.dart';

class Head extends StatefulWidget {
  @override
  _HeadState createState() => _HeadState();
}

class _HeadState extends State<Head> with SingleTickerProviderStateMixin {

    Animation<double> animation;            
  AnimationController controller; 
  @override
  void initState() {
    super.initState();
      controller =AnimationController(duration: const Duration(seconds: 18),vsync: this);            
  animation = Tween<double>(begin: 0.0, end: 15.0).animate(controller);      
   controller.forward(); 
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
      } 

  @override
  Widget build(BuildContext context) {
    
        return Container(
          alignment: Alignment.topCenter,
                  height: 300,
                  width: 450,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                        Colors.red[900],
                        Colors.red[500],
                        Colors.red[200]
                      ],
                    ),
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))   
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(tag:'logo', child: RotatedLogo(animation: animation)),                              
                 Padding(
                     padding: const EdgeInsets.only(top:28.0),
                     child: Row(
                           mainAxisAlignment: MainAxisAlignment.end, 
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(right:30,top: 10),
                           child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 25,),textAlign: TextAlign.end),
                     ),
                   ],
                 ),
             )
],),)
      
    );
  }
}
