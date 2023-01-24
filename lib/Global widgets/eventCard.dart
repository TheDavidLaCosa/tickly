import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eventCard extends StatefulWidget {
  final String image;
  final String title;
  final String time;
  final String country;
  final String city;
  final String link;

  eventCard({
    required this.image,
    required this.title,
    required this.time,
    required this.country,
    required this.city,
    required this.link,
  });

  @override
  _eventCardState createState() => _eventCardState();
}

class _eventCardState extends State<eventCard> {
  bool isLiked = false;

  void _likeEvent() {
    setState(() {
      isLiked = !isLiked;
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
                child: Image.asset(widget.image),
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
                          icon: Icon(Icons.info, color: Color.fromRGBO(210, 36, 36, 1),),
                          onPressed: () { //TODO More info
                          },
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -8),
                        child: IconButton(
                          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: Color.fromRGBO(210, 36, 36, 1),),
                          onPressed: _likeEvent,
                          //TODO: Like button
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
