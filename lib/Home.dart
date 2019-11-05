import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';
// import 'package:my_app/Widgets/Animatedlogo.dart';
import 'package:my_app/Widgets/RotatedLogo.dart';
import 'Login.dart';
import 'SecondScreen.dart';


class HomeDetails {


static List det = [
{
  'img': 'assets/images/photo2.jpg',
  'title': 'Photographers',
  'icon': Icons.linked_camera,
},

{
  'img': 'assets/images/venue1.jpg',
  'title': 'Venues',
  'icon': Icons.place,
},

{
  'img': 'assets/images/food3.jpg',
  'title': 'Catering',
  'icon': Icons.local_dining,
},

{
  'img': 'assets/images/card1.jpg',
  'title': 'Invitations',
  'icon':  Icons.card_giftcard
}

];


}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
var scaffoldKey = GlobalKey<ScaffoldState>();
 Animation<double> animation;            
  AnimationController controller; 
  @override
  void initState() {
    super.initState();
      controller =AnimationController(duration: const Duration(seconds: 10), vsync: this);            
  animation = Tween<double>(begin: 0.0, end: 100.0).animate(controller);      

   controller.forward();  }    

@override
void dispose() {            
controller.dispose();            
super.dispose();            
 }


@override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: new Drawer(
           child: Column(
         children: <Widget>[
           GestureDetector(
             child: UserAccountsDrawerHeader(
               accountName: Text("Samvit Chrungoo"),
               accountEmail: Text("samchrungoo@gmail.com"),
               currentAccountPicture: CircleAvatar(

                 child: Text(
                   "S",
                   style: TextStyle(fontSize: 40.0),
                 ),
               ),
             ),
             onTap: () {},
           ),
           Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   IconButton(
                     icon: Icon(Icons.create),
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => Login(),
                         ),
                       );
                     },
                   ),
                   Text(
                     "Login/Signup",
                     style: TextStyle(fontWeight: FontWeight.w600),
                   )
                 ],
               )
             ],
           ),
           Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   IconButton(
                     icon: Icon(Icons.home),
                     onPressed: () {},
                   ),
                   Text(
                     "Home",
                     style: TextStyle(fontWeight: FontWeight.w600),
                   )
                 ],
               )
             ],
           ),
           Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   IconButton(
                     icon: Icon(Icons.chat),
                     onPressed: () {},
                   ),
                   Text(
                     "Chat with us",
                     style: TextStyle(fontWeight: FontWeight.w600),
                   )
                 ],
               )
             ],
           ),
         ],
       )

        ),
        body: Stack(
              children: <Widget>[
       Container(      
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back1.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: <Widget>[
   Padding(
     padding: const EdgeInsets.only(top:50,bottom: 20),
    //  child: Icon(Icons.blur_on,size:100,color: Colors.white,),
    child: RotatedLogo(animation: animation),
   ),
   Padding(
     padding: const EdgeInsets.only(bottom:40.0),
     child: Container(
       decoration: BoxDecoration(
         color: Colors.white12,
         borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
       child: Padding(
         padding: const EdgeInsets.all(10),
         child: Text("Wedding Planner",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600,fontFamily:'DancingScript'),),
       ))
     ,
   ),
Carousel(
            height: 380,
            width: 500,
            type: "slideswiper",
            indicatorType: "bar",
            axis: Axis.horizontal,
            showIndicator: false,
            
           children: HomeDetails.det.map((asset) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => SecondScreen(asset)));
                },
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: (Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(asset['img']),
                                fit: BoxFit.cover,),
                          )
                              )),
                      ),
                  Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: 400,
                  color: Colors.redAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text(asset['title'],style: TextStyle(color:Colors.white,fontSize: 25)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(asset['icon'],color: Colors.white,size: 25,),
                    )
                  ],),
              ),
                    ],
                  ),
                );
              }).toList(),

 ) ,

 Padding(
   padding: const EdgeInsets.only(bottom:15.0,top:30),
   child: Text("We help you to plan your",style:TextStyle(color: Colors.white,fontSize: 35,fontFamily: 'DancingScript')),
 ),
 Text("\"Dream Wedding\"",style:TextStyle(color: Colors.white,fontSize: 45,fontFamily: 'DancingScript',fontWeight: FontWeight.w600))

 ]),
),
            Positioned(
              left: 10,
              top: 30,
              child: IconButton(
                icon: Icon(Icons.menu,color: Colors.white,size: 30,),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            )],
            )
    );
  }
}