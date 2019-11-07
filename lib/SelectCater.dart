import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/Details/CaterDetail.dart';
import 'package:my_app/FixedBar.dart';
import 'package:my_app/Sheet.dart';


class SelectCater extends StatefulWidget {
  final index;
  SelectCater(this.index){print(index);}
  @override
  _SelectCaterState createState() => _SelectCaterState();
}

class _SelectCaterState extends State<SelectCater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
  floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
  floatingActionButton: FloatingActionButton( 
    backgroundColor: Colors.white,
    onPressed: () { 
      showModalBottomSheet(context: context,builder: (context){
      return Sheet();
    }); 
    },
    child: Icon(Icons.keyboard_arrow_up,color: Colors.redAccent,size: 50,),
  ),

  bottomNavigationBar: FixedBar(widget.index),

body: CustomScrollView(
   scrollDirection: Axis.vertical,
   slivers: <Widget>[
          SliverAppBar(
            
        expandedHeight: 180.0,
        leading: IconButton (onPressed: (){Navigator.pop(context);},
           icon: Icon(Icons.arrow_back),),
            pinned: true,  
            centerTitle: false,
            flexibleSpace: new FlexibleSpaceBar( 
              title: Text(CaterDetail.details[widget.index]['name'],textAlign: TextAlign.start,), 
              background:
              Hero(
            tag: CaterDetail.details[widget.index],
                child: Container(
                  child: Image.asset(CaterDetail.details[widget.index]['img'],
                          fit: BoxFit.cover),
                ),
              ),
            ),
          ),
SliverList(
delegate: SliverChildBuilderDelegate(
  (context,index) => Column(children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 210,
        width: 500,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(CaterDetail.details[widget.index]['name'],style: TextStyle(fontSize: 22,),),
          ),
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:5,right:5),
              child: Icon(Icons.place,size:20),
            ),
          Text(CaterDetail.details[widget.index]['place'],style: TextStyle(fontSize:16),),
          Padding(
              padding: const EdgeInsets.only(left:5,right:5),
            child: InkWell(onTap: (){},
            child: Text("(View on Map)",style: TextStyle(fontSize:16))),
          ),],),

          Row(
            children: <Widget>[
              Expanded( flex: 1, child: Padding(
                padding: const EdgeInsets.only(top:15,right: 20,left: 20),
                child: Container(
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.mail,color: Colors.redAccent,size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(right:5),
                      child: Text("Message",style: TextStyle(color: Colors.redAccent,fontSize: 20,),),
                    )
                  ],),
                height: 50,
                decoration: BoxDecoration(color: Colors.white,
                border: Border.all(color:Colors.redAccent)
                ),),
              )),

   Expanded( flex: 1, child: Padding(
                padding: const EdgeInsets.only(top:10,right: 20,left: 20),
                child: Container(
                  child: Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.call,color: Colors.white,size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(right:25,left: 10),
                      child: Text("Call",style: TextStyle(color: Colors.white,fontSize: 20,),),
                    )
                  ],),
                height: 50,
                decoration: BoxDecoration(color: Colors.green,
                border: Border.all(color:Colors.green)
                ),),
              )),
            ],
          ),
  Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row( 
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
                Padding(
                padding: const EdgeInsets.only(bottom:5),
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
                                Text(CaterDetail.details[widget.index]['rating'],style: TextStyle(color: Colors.white,fontSize: 14),),
                              ],),
                            ),
                ),
                       
                        Text("Rating")
            ],
          ),

           Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:2),
                child: Icon(FontAwesomeIcons.heart),
              ),
                        Text("Shortlist")
            ],
          ),

           Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:2),
                child: Icon(Icons.share),
              ), 
                        Text("Rating")
            ],
          ),
        ],
      ),
  ) 
        ],),

      ),
    )  ,

    
    ],),
    

  childCount:1,
)
)

          ])
          );

 


  }
}