import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'Widgets/RotatedLogo.dart';
import 'Validation.dart';


void main() => runApp(MaterialApp(
    home:  Signup(),  
));

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup>  with SingleTickerProviderStateMixin{

 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final registername = TextEditingController();
  final registeremail = TextEditingController();
  final registerpassword = TextEditingController();
  final registercnfpassword = TextEditingController();
  static String corectpassword;

  Animation<double> animation;            
  AnimationController controller; 
  @override
  void initState() {
      super.initState();
      controller =AnimationController(duration: const Duration(seconds: 18), vsync: this);            
      animation = Tween<double>(begin: 0.0, end: 15.0).animate(controller);      
      controller.forward(); 
        //   animation.addStatusListener((status) {
        //   if (status == AnimationStatus.completed) {
        //     controller.repeat();
        //   }
        // });
          }       
     static bool auto = false;
     bool _hidden =true;
    
     void _toggle ()
     {
       setState(() {
         _hidden = !_hidden;
       });
     }
     
     
     @override
    void dispose() {            
    controller.dispose();            
    super.dispose();            
     }
    
      @override
      Widget build(BuildContext context) {
        timeDilation=3;
        return Scaffold(
          resizeToAvoidBottomPadding: true,
          body:  Container(
              child: Column
              (
                children: <Widget>[
                Container(
                  alignment: Alignment.center,
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
                              Container(
                                 alignment: Alignment.bottomRight,
                                 decoration: BoxDecoration(color: Colors.white ,
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))),
                                 child: Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Text("REGISTER",style: TextStyle(color: Colors.redAccent,fontSize: 22,),textAlign: TextAlign.end),
                                 ))  ],
                     ),  ) ], ),)),
    
    // Head(),
      Expanded(
        child: Container(
         child: Padding(
           padding: const EdgeInsets.only(top:20),
           child: Container(
             child: Form(
                 key: formKey,
               autovalidate: auto,
               child: ListView(
                 children: <Widget>[
                   Padding(
                     padding:const EdgeInsets.only(right: 20,left: 20),
                     child: TextFormField(
                       controller:registername,
                       validator: Validation.valName,
                       textAlign: TextAlign.left,
                       decoration: InputDecoration( 
                         prefixIcon: Icon(Icons.border_color),
                         labelText: ' Name',
                          filled: true,
                          border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.elliptical(30, 30)),
                                    gapPadding: 10.0,
                                  ),
                                  ),
                     ),
                   ),           SizedBox(height: 20),
                    Padding(
                     padding:const EdgeInsets.only(right: 20,left: 20),
                      child: TextFormField(
                        controller:registeremail,
                        validator: Validation.valEmail,
                       textAlign: TextAlign.left,
                       decoration: InputDecoration( 
                         prefixIcon: Icon(Icons.email),
                         labelText: ' Email',
                          filled: true,
                          border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.elliptical(30, 30)),
                                    gapPadding: 10.0,
                                  ),
                                  ),
                   ),
                    ),
                   SizedBox(height: 20),
                   Padding(
                     padding:const EdgeInsets.only(right: 20,left: 20),
                     child: TextFormField(
                       controller:registerpassword,
                       validator: Validation.valPassword,
                       textAlign: TextAlign.left,
                       decoration: InputDecoration( 
                         prefixIcon:Icon(Icons.security), 
                         suffixIcon: (_hidden) ? IconButton(icon:Icon(Icons.visibility_off),
                         onPressed:() { _toggle(); },
                         ) : 
                         IconButton(icon:Icon(Icons.visibility),
                         onPressed:() { _toggle(); },
                         ) , 
                         labelText: ' Password',
                          filled: true,
                          border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.elliptical(30, 30)),
                                     gapPadding: 10.0,
                                  ),
                                  ),
               obscureText: (_hidden) ? true: false,
                     ),
    
    
                   ),  
                            SizedBox(height: 20),
                        Padding(
                     padding:const EdgeInsets.only(right: 20,left: 20),
                       child: TextFormField(
                         controller:registercnfpassword,
                        validator: (value){
                          if(value != registerpassword.text)
                          return "Passwords don't match";
                          else return null;
                        },
                     textAlign: TextAlign.left,
                     decoration: InputDecoration( 
                       prefixIcon:Icon(Icons.security), 
                       suffixIcon: (_hidden) ? IconButton(icon:Icon(Icons.visibility_off),
                       onPressed:() { _toggle(); },
                       ) : 
                       IconButton(icon:Icon(Icons.visibility),
                       onPressed:() { _toggle(); },
                       ) , 
    
                       labelText: ' Comfirm Password',
                          filled: true,
                          border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.elliptical(30, 30)),
                                     gapPadding: 10.0,
                                  ),
                                  ),
               obscureText: (_hidden) ? true: false,
                   ),
                        ),
                Padding(
                  padding: const EdgeInsets.only(top: 25,bottom: 20,right: 100,left: 100),
                  child: GestureDetector(
                    onTap: (){
                      register();
                },
                    child: Container(
                      width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                            colors: <Color>[
                              Colors.red[200],
                              Colors.red[500],             
                              Colors.red[800],
                            ],
                          ),
                        ),
                        padding:EdgeInsets.all(15.0),
                        child: Center(
                          child: Text('Create Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400, color: Colors.white)
                          ),
                        ),
                      ),
    
                  ),
                ),

           
    
                InkWell( onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Login()));},
                child: Text("Already have an Account ?? Sign In",style: TextStyle(color: Colors.redAccent,fontSize: 16),textAlign: TextAlign.center,)),
    Padding(
      padding: const EdgeInsets.only(left:25.0,right:25.0,top:35.0,bottom:35.0),
      child:   Row(children: <Widget>[
        Expanded(child: Divider(color: Colors.redAccent,)),
        Text("  OR ",style: TextStyle(color: Colors.redAccent,fontSize: 15)),
        Expanded(child: Divider(color: Colors.redAccent,)),

      ],),
    ),


    
    Row(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(onPressed: (){},
        padding: EdgeInsets.only(left: 15, right: 15),
      icon:Icon(FontAwesomeIcons.facebook),iconSize: 40,color: Colors.blue[900],),
        IconButton(onPressed: (){},
         padding: EdgeInsets.only(left: 15, right: 15),
      icon:Icon(FontAwesomeIcons.googlePlus),iconSize: 40,color: Colors.red),
       IconButton(onPressed: (){},
       padding: EdgeInsets.only(left: 15, right: 15),
      icon:Icon(FontAwesomeIcons.twitter),iconSize: 40,color: Colors.blueAccent),
    ],
    ),
    
                 ],
               ),
             ),
           ),
         ),
        ),
      ),
     ],
              ),
            ),
          );
   }
    
  Future register() async {
  auto=true;
  if (formKey.currentState.validate()) 
  {
 SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString(registeremail.text,registerpassword.text);  
   prefs.setString("name",registername.text);
    print(prefs.getString(registeremail.text)) ;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Home()));

  }
  else 
    showDialog(context:context,builder:(BuildContext context)=>AlertDialog(title: Text("Error:"), content: Text("Please Enter Valid Details",style: TextStyle(fontSize: 20,),),));
  
   }

}



  
