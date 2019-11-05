import 'package:flutter/material.dart';
import 'package:my_app/Widgets/Cater.dart';
import 'Widgets/Invitation.dart';
import 'Widgets/Photo.dart';
import 'Widgets/Venue.dart';



class SecondScreen extends StatefulWidget {
  final asset;
  SecondScreen(this.asset);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}


class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.asset['title']=='Photographers')
    return Photo(widget.asset);

    else if(widget.asset['title']=='Venues')
    return Venue(widget.asset);

     else if(widget.asset['title']=='Invitations')
    return Invitation(widget.asset);

    else return Cater(widget.asset);
      }
}