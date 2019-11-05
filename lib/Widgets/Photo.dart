import 'package:flutter/material.dart';
import 'package:my_app/Details/PhotoDetail.dart';
import 'package:my_app/Home.dart';

class Photo extends StatefulWidget {
  final asset;
  Photo(this.asset);
  @override
  _PhotoState createState() => _PhotoState();
}


class _PhotoState extends State<Photo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right:20.0),
          child: Icon(widget.asset['icon'],color: Colors.white,),
        ), 
        ],
        title: Text(widget.asset['title'],style: TextStyle(fontSize: 25,color: Colors.white),),

        backgroundColor: Colors.redAccent,
        leading: IconButton(
          onPressed: (){ Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Home()));},
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),

body: ListView.builder(
        itemCount: PhotoDetail.details.length ,
        itemBuilder: (BuildContext context ,int index){
          return Container(
child: Row(
  children: <Widget>[
    Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top:8,bottom: 8,),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 200,
          width: 200,
          decoration: BoxDecoration(color: Colors.white,
              border: Border.all(color: Colors.grey),
                boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(0.10, 10.60),
                  blurRadius:  25.0,
                ),
              ],
          image: DecorationImage(image: AssetImage(PhotoDetail.details[index]['img']),fit: BoxFit.cover) 
          ),
        ),
      ),
    ),




    Expanded(flex: 1,
    child: Container
    (
     height: 200,
     width: 200,
     decoration: BoxDecoration(color: Colors.white,
              border: Border.all(color: Colors.grey),
                boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(0.10, 10.60),
                  blurRadius:  25.0,
                ),
              ],
          ),
     child: Padding(
       padding: const EdgeInsets.all(12.0),
       child: Column 
       ( crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
         Text(PhotoDetail.details[index]['name'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Container(
            decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(10))
),
               height: 22,
              width: 55,
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:5.0,right: 5.0),
                  child: Icon(Icons.star,color: Colors.white,size: 17,),
                ),
                Text(PhotoDetail.details[index]['rating'],style: TextStyle(color: Colors.white,fontSize: 14),),
              ],),
            ),
          ),
  Padding(
    padding: const EdgeInsets.only(top:8.0),
    child: Text("32 Reviews",style: TextStyle(color: Colors.black,fontSize: 15),),
  ),
  Padding(
    padding: const EdgeInsets.only(left: 0,top:6,bottom: 6),
    child: Row(
      children: <Widget>[
          Icon(Icons.place,size:17,color: Colors.redAccent,),
          Text(PhotoDetail.details[index]['place'],style: TextStyle(color: Colors.black,fontSize: 17),)
      ],
    ),
  ),
 Divider(color: Colors.grey,),
 Padding(
   padding: const EdgeInsets.only(top:8.0),
   child: Row(
     children: <Widget>[
         Text(PhotoDetail.details[index]['price'],style: TextStyle(color: Colors.redAccent,fontSize: 18,fontWeight: FontWeight.w600),),
         Text(" /-  per plate",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.w300),),
     ],
   ),
 )

  

       ],),
     ),
      
    ),)
  ],
),
          );
        }
        )
    );
  }
}