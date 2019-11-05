import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class RotatedLogo extends AnimatedWidget{
     RotatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context){
  final animation = listenable as Animation<double>;
return 
 Transform.rotate(angle:animation.value ,child: Icon(Icons.blur_on,size:100,color: Colors.white,));
  }
}
