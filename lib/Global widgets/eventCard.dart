import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/scheduler.dart';

import '../PantallaInfo.dart';

class eventCard extends StatefulWidget {
  final String image;
  final String title;
  final String time;
  final String country;
  final String city;
  final String link;
  final String id;

  eventCard({
    required this.image,
    required this.title,
    required this.time,
    required this.country,
    required this.city,
    required this.link,
    required this.id,
  });

  @override
  _eventCardState createState() => _eventCardState();
}

class _eventCardState extends State<eventCard> {
  bool isLiked = false;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final user = FirebaseAuth.instance.currentUser!;



  Future<void> _likeEvent() async {
    if(!isLiked){
      print (user.uid);
      await ref.child(user.uid).child(widget.id).set({
        "title": widget.title,
        "date": widget.time,
        "location": widget.city,
        "city": widget.country,
        "moreInfo": widget.link,
        "img": widget.image,
        "id": widget.id
      });
      setState(() {
        isLiked = true;
      });
    }else{
      setState(() {
        isLiked = false;
      });
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        await ref.child(user.uid).child(widget.id).remove();
      });
    }
  }

  Future<bool> checkIfLiked(String id) async {
    final snapshot = await FirebaseDatabase.instance.ref().child(user.uid).child(widget.id).once();
    if (snapshot.snapshot.exists) {
      setState(() {
        isLiked = true;
      });
      return true;
    } else {
      setState(() {
        isLiked = false;
      });
      return false;
    }
  }



  @override
  void initState(){
    super.initState();
    checkIfLiked(widget.id).then((value) {
      setState(() {
        isLiked = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(210, 210, 210, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 50,
              child: AspectRatio(
                aspectRatio: 16/9,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: widget.image,
                ),
              )),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(widget.title, style: TextStyle(fontFamily: "jaldi", fontSize: 17, height: 1), overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                const SizedBox(height: 5),
                Text(widget.time + " in " + widget.city + " (" + widget.country + ")", style: TextStyle(fontFamily: "jaldi", fontSize: 13, height: 1), overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                const SizedBox(height: 5),
                Container(
                  height: 20,
                  padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0, -8),
                        child: IconButton(
                          icon: Icon(Icons.info_outline_rounded, color: Color.fromRGBO(210, 36, 36, 1),),
                          onPressed: () async {


                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PantallaInfo(id: widget.id),
                                  ),
                                );
                                checkIfLiked(widget.id);
                          },
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -8),
                        child: IconButton(
                          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: Color.fromRGBO(210, 36, 36, 1),),
                          onPressed: () {
                            _likeEvent();
                            checkIfLiked(widget.id);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
