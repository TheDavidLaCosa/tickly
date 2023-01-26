import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:tickly/EventModel.dart';

import 'Global widgets/eventCard.dart';

class PantallaFavourites extends StatefulWidget {
  @override
  State<PantallaFavourites> createState() => _PantallaFavouritesState();
}

class _PantallaFavouritesState extends State<PantallaFavourites> {
  //EventModel _data = EventModel(embedded: null, links: null, page: null);
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
        title: const Text('TICKLY',
            style: TextStyle(fontFamily: "jaldi", fontSize: 30)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(232, 231, 231, 1),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color.fromRGBO(232, 231, 231, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text("MY FAVOURITE EVENTS!",
                  style: TextStyle(
                      fontFamily: "jaldi",
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              Expanded(
                  child: StreamBuilder(
                stream: ref.child('1').onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if(!snapshot.hasData || (snapshot.data!.snapshot.value == null)){
                    return Column(children: [SizedBox(height: 40), Text("You don't have any favourites yet", style: TextStyle(
                  fontFamily: "jaldi",
                  fontSize: 25))]);
                  }else{
                    Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    list.clear;
                    list = map.values.toList();
                    return ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, index) {
                          return eventCard(image: list[index]['img'], title: list[index]['title'], time: list[index]['date'], country: list[index]['city'], city: list[index]['location'], link: list[index]['moreInfo'], id: list[index]['id']);
                        });
                  }

                },
              )),

              /*Expanded(
                child: ListView.builder(
                  itemCount: _data.page!.totalElements! < 200 ? _data.page!.totalElements! : 200,
                  itemBuilder: (context, index) {
                    if(_data.embedded!.events![index].embedded != null){
                      return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: _data.embedded!.events[index]!.embedded!.venues[0]!.country!.name!, city: _data.embedded!.events[index]!.embedded!.venues[0]!.city!.name!, link: _data.embedded!.events[index]!.url!, id: _data.embedded!.events[index]!.id!);
                    }else{
                      return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: "No country", city: "No city", link: _data.embedded!.events[index]!.url!, id: _data.embedded!.events[index]!.id!);

                    }
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
