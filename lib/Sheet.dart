import 'package:flutter/material.dart';


class Sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:10,bottom: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Per Day Prices",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Text("Done",style: TextStyle(fontSize: 20,color: Colors.redAccent,fontWeight: FontWeight.w500))
            ],
          ),
        ),
Divider(color: Colors.redAccent,),

Text("Photo + Video Package",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
Padding(
  padding: const EdgeInsets.only(top:8.0),
  child:   Text("50,000 /-",style:TextStyle(fontSize: 16,color: Colors.redAccent)),
),
Divider(color: Colors.grey,),
Padding(
  padding: const EdgeInsets.only(top:8),
  child:   Text("Pricing Info:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
),
Padding(
  padding: const EdgeInsets.only(top:20.0),
  child:   Text("Candid Photography"),
),
Text("18,000 /- per day",style: TextStyle(color:Colors.grey,)),
Padding(
  padding: const EdgeInsets.only(top:20.0),
  child:   Text("Candid Photography"),
),
Text("18,000 /- per day",style: TextStyle(color:Colors.grey,)),
Padding(
  padding: const EdgeInsets.only(top:20.0),
  child:   Text("Candid Photography"),
),
Text("18,000 /- per day",style: TextStyle(color:Colors.grey,)),
Padding(
  padding: const EdgeInsets.only(top:20.0),
  child:   Text("Candid Photography"),
),
Text("18,000 /- per day",style: TextStyle(color:Colors.grey,)),
Padding(
  padding: const EdgeInsets.only(top:20.0),
  child:   Text("Candid Photography"),
),
Text("18,000 /- per day",style: TextStyle(color:Colors.grey,)),
      ],),
    ),
    );
  }
}