import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tickly/EventModel.dart';
import 'package:tickly/PantallaFavourites.dart';
import 'package:tickly/PantallaNearEvent.dart';

import 'Global widgets/redButton.dart';
import 'Global widgets/textInput.dart';
import 'Global widgets/timePicker.dart';
import 'PantallaResults.dart';

class PantallaSearch extends StatefulWidget {
  const PantallaSearch({super.key});

  @override
  State<PantallaSearch> createState() => _PantallaSearchState();
}

class _PantallaSearchState extends State<PantallaSearch> {
  final _formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  String _startDate = "";
  String _endDate = "";
  final _event = TextEditingController();
  final _location = TextEditingController();

  Future<EventModel> _search (String event, String startDate, String location) async {
    final uri = Uri.https('app.ticketmaster.com', 'discovery/v2/events', {
      'apikey': '7elxdku9GGG5k8j0Xm8KWdANDgecHMV0',
      'keyword': event,
      'locale': 'es',
      'startDateTime': startDate,
      'city': location,
      'size': "200",
      'sort': "date,name,asc"
    });
    final response = await http.get(uri).catchError((error) => 0);
    if (response.statusCode == 200) {
      return EventModel.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Error while fetching data");
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = _formatter.format(DateTime(now.year, now.month, now.day));
    _endDate =
        _formatter.format(DateTime(now.year, now.month, now.day, 23, 59));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
        title: const Text('TICKLY',
            style: TextStyle(fontFamily: "jaldi", fontSize: 30)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout_rounded, size: 25),
            onPressed: () {
              //TODO: Logout
              //Logout action here
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(232, 231, 231, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              color: const Color.fromRGBO(232, 231, 231, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const <Widget>[
                              Text("Welcome,",
                                  style: TextStyle(
                                      fontFamily: "jaldi",
                                      fontSize: 23,
                                      height: 1)),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                child: Icon(Icons.favorite_rounded,
                                    color: Colors.red, size: 45),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PantallaFavourites()),
                                  );
                                },
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                child: const Icon(Icons.travel_explore_rounded,
                                    color: Colors.red, size: 45),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PantallaNearEvent()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "user@gmail.com",
                      style: TextStyle(
                          fontFamily: "jaldi", fontSize: 26, height: 1.2),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text("LET'S FIND MY NEXT EVENT!",
                      style: TextStyle(
                          fontFamily: "jaldi",
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 35),
                  TextInput(text: "Keyword of the event", controller: _event),
                  const SizedBox(height: 20),
                  TextInput(
                      text: "City of the event", controller: _location),
                  const SizedBox(height: 45),
                  const Text("Events starting after:",
                      style: TextStyle(fontFamily: "jaldi", fontSize: 22)),
                  const SizedBox(height: 10),
                  TimePicker(onDateSelected: (_auxDate) {
                    _startDate = _formatter.format(DateTime(
                        _auxDate.year,
                        _auxDate.month,
                        _auxDate.day,
                        00,
                        00));
                    print(_endDate);
                  }),
                  const SizedBox(height: 50),
                  //TODO Red button
                  RedButton(
                      text: "SEARCH",
                      function: () => {
                            _search(_event.text, _startDate, _location.text)
                                .then((data) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PantallaResults(data: data),
                                ),
                              );
                            }).catchError((error) => {print(error)})
                          }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
