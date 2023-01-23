import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'Global widgets/redButton.dart';
import 'Global widgets/textInput.dart';
import 'Global widgets/timePicker.dart';

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

  Future<http.Response> _search() async {
    final uri = Uri.https('app.ticketmaster.com', 'discovery/v2/events', {
      'apikey': '7elxdku9GGG5k8j0Xm8KWdANDgecHMV0',
      'keyword': _event.text,
      'locale': '*',
      'startDateTime': _startDate,
      'endDateTime': _endDate,
      'city': _location.text,
    });
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = _formatter.format(DateTime(now.year, now.month, now.day));
    _endDate = _formatter.format(DateTime(now.year, now.month, now.day, 23, 59));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
        title: const Text('TIKLY', style: TextStyle(fontFamily: "jaldi", fontSize: 30)),
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
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                          Text("Welcome,", style: TextStyle(fontFamily: "jaldi", fontSize: 23, height: 1)),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            child: Icon(Icons.favorite_rounded, color: Colors.red, size: 45),
                            onTap: () {
                              //TODO Navigate to favourites
                            },
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            child: const Icon(Icons.travel_explore_rounded, color: Colors.red, size: 45),
                            onTap: () {
                              //TODO navigate to the explore screen
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
                  style: TextStyle(fontFamily: "jaldi", fontSize: 26, height: 1.2),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 25),
              const Text("LET'S FIND MY NEXT EVENT!", style: TextStyle(fontFamily: "jaldi", fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextInput(text: "Keyword of the event", controller: _event),
              const SizedBox(height: 20),
              TextInput(text: "Location of the event", controller: _location),
              const SizedBox(height: 20),
              const Text("Date of the event", style: TextStyle(fontFamily: "jaldi", fontSize: 22)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        const Text("From", style: TextStyle(fontFamily: "jaldi", fontSize: 19)),
                        TimePicker(onDateSelected: (_auxDate) {
                          _startDate = _formatter.format(DateTime(_auxDate.year, _auxDate.month, _auxDate.day));
                          print(_startDate);
                        })
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        const Text("To", style: TextStyle(fontFamily: "jaldi", fontSize: 19)),
                        TimePicker(onDateSelected: (_auxDate) {
                          _endDate = _formatter.format(DateTime(_auxDate.year, _auxDate.month, _auxDate.day, 23, 59));
                          print(_endDate);
                        })
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              //TODO Red button
              RedButton(text: "SEARCH", function: () => {print(_location.text), print(_startDate), print(_endDate)}),
              ],
             ),
            ),
          ),
        ),
      ),
    );
  }
}
