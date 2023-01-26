import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tickly/EventModel.dart';

import 'Global widgets/eventCard.dart';

class PantallaResults extends StatefulWidget {
  final EventModel data;

  const PantallaResults({required this.data});

  @override
  State<PantallaResults> createState() => _PantallaResultsState();
}

class _PantallaResultsState extends State<PantallaResults> {
  EventModel _data = EventModel(embedded: null, links: null, page: null);
  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
        title: const Text('TICKLY', style: TextStyle(fontFamily: "jaldi", fontSize: 30)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 25),
          onPressed: () {
            //TODO: Go back
            //Go back action here
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
                    const Text("HERE IS WHAT WE FOUND!", style: TextStyle(fontFamily: "jaldi", fontSize: 30, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: _data.page!.totalElements! != 0 ? ListView.builder(
                        itemCount: _data.page!.totalElements! < 200 ? _data.page!.totalElements! : 200,
                        itemBuilder: (context, index) {
                          if(_data.embedded!.events![index].embedded != null){
                            return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: _data.embedded!.events[index]!.embedded!.venues[0]!.country!.name!, city: _data.embedded!.events[index]!.embedded!.venues[0]!.city!.name!, link: _data.embedded!.events[index]!.url!, id: _data.embedded!.events[index]!.id!);
                          }else{
                            return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: "No country", city: "No city", link: _data.embedded!.events[index]!.url!, id: _data.embedded!.events[index]!.id!);
                          }
                        },
                      ) : Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [SizedBox(height: 40), Text("NOTHING! Please go back and look for another event", textAlign: TextAlign.center, style: TextStyle(
                                fontFamily: "jaldi",
                                fontSize: 25))]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
