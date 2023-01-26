import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tickly/EventModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Global widgets/redButton.dart';

class PantallaInfo extends StatefulWidget {
  final String id;

  const PantallaInfo({required this.id});

  @override
  State<PantallaInfo> createState() => _PantallaInfoState();
}

class _PantallaInfoState extends State<PantallaInfo> {
  late String _id;
  EventModel _data = EventModel(embedded: null, links: null, page: null);
  late Future<EventModel> _future;

  @override
  void initState() {
    super.initState();
    _id = widget.id;
    _future = _search();
  }

  Future<EventModel> _search() async {
    final uri = Uri.https('app.ticketmaster.com', 'discovery/v2/events', {
      'apikey': '7elxdku9GGG5k8j0Xm8KWdANDgecHMV0',
      'id': _id,
    });
    final response = await http.get(uri).catchError((error) => 0);
    if (response.statusCode == 200) {
      print(uri);
      return EventModel.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Error while fetching data");
    }
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
            //TODO: Go back
            //Go back action here
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(232, 231, 231, 1),
      body: SafeArea(
        child: SingleChildScrollView(
            child: FutureBuilder(
                future: _search(),
                builder: (context, snapshort) {
                  if (snapshort.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshort.hasData) {
                    return _buildColumn();
                  }
                  return Text("");
                })),
      ),
    );
  }

  Widget _buildColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopContainer(),
          _buildMidContainerWithButton(),
          _buildBottomContainer(),
        ],
      );

  Widget _buildTopContainer() => Container(
        child: FutureBuilder(
            future: _search(),
            builder: (context, snapshort){
              if(snapshort.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),
                );
              }else if(snapshort.hasData){
                return Container(
                    width: MediaQuery.of(context).size.width,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/prova.jpg',
                        image: snapshort.data!.embedded!.events[0]!.images[0]!.url!,
                      ),
                    )
                );
              }
              return Text("");
            }
        ),
      );

  Widget _buildMidContainerWithButton() {
    final buttonSize = 70.0;
    return Stack(
      children: [
        Container(height: buttonSize, color: Color.fromRGBO(232, 231, 231, 1)),
        Transform.translate(
          offset: Offset(100.0, -buttonSize / 2.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                //TODO When pressing
              },
              child: Container(
                height: buttonSize,
                width: buttonSize,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 186, 184, 1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite_rounded,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomContainer() => Container(
      color: const Color.fromRGBO(232, 231, 231, 1),
      child: Column(
        children: [
          FutureBuilder(
              future: _search(),
              builder: (context, snapshort) {
                if (snapshort.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshort.hasData) {
                  return Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(snapshort.data!.embedded!.events[0]!.name!,
                          style: TextStyle(
                            fontSize: 26.0,
                            fontFamily: 'jaldi',
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(snapshort.data!.embedded!.events[0]!.classifications[0]!.genre!.name! + ", " + snapshort.data!.embedded!.events[0]!.classifications[0]!.subGenre!.name!,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'jaldi',
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [
                            Row(children: [
                              Image.asset('assets/images/calendar.png',
                                  height: 50),
                              SizedBox(width: 30),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(DateFormat('yyyy-MM-dd').format(snapshort.data!.embedded!.events[0]!.dates!.start!.localDate!),
                                        style: TextStyle(
                                          fontSize: 21.0,
                                          fontFamily: 'jaldi',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(snapshort.data!.embedded!.events[0]!.dates!.start!.localTime!,
                                        style: TextStyle(
                                          fontSize: 21.0,
                                          fontFamily: 'jaldi',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [
                            Row(children: [
                              Image.asset('assets/images/price.png',
                                  height: 50),
                              //Expanded(child: Container()),
                              SizedBox(width: 30),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("From " + snapshort.data!.embedded!.events[0]!.priceRanges[0]!.min!.toString() + " to " +
                                    snapshort.data!.embedded!.events[0]!.priceRanges[0]!.max!.toString() + " " + snapshort.data!.embedded!.events[0]!.priceRanges[0]!.currency!,
                                  style: TextStyle(
                                    fontSize: 21.0,
                                    fontFamily: 'jaldi',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [
                            Row(children: [
                              Image.asset('assets/images/location.png',
                                  height: 50),
                              SizedBox(width: 30),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(snapshort.data!.embedded!.events[0]!.embedded!.venues[0]!.name!,
                                        style: TextStyle(
                                          fontSize: 21.0,
                                          fontFamily: 'jaldi',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(snapshort.data!.embedded!.events[0]!.embedded!.venues[0]!.address!.line1! + ", " +
                                          snapshort.data!.embedded!.events[0]!.embedded!.venues[0]!.postalCode! + " " +
                                          snapshort.data!.embedded!.events[0]!.embedded!.venues[0]!.city!.name!,


                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: 'jaldi',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      RedButton(
                          text: "Buy tickets",
                          function: () => {_launchUrl(Uri.parse(snapshort.data!.embedded!.events[0]!.url!))}),
                      SizedBox(height: 20),
                    ]),
                  );
                }
                return Text("");
              }),
        ],
      ));

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    } else {}
  }
}
