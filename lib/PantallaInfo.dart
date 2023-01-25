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
  const PantallaInfo({super.key});

  @override
  State<PantallaInfo> createState() => _PantallaInfoState();
}

class _PantallaInfoState extends State<PantallaInfo> {
  final Uri _url = Uri.parse('https://www.ticketmaster.es/event/michael-buble-higher-tour-2023-entradas/32301');

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
            //TODO: Go back
            //Go back action here
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(232, 231, 231, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildColumn(),
        ),
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
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/prova.jpg',
            image:
                'https://s1.ticketm.net/dam/a/606/d5137e2d-c5f4-4438-a1cf-2d1eb0e5b606_1789531_RETINA_PORTRAIT_16_9.jpg',
          ),
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
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Michael Bublé - Higher Tour 2023',
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
                child: Text(
                  'Rock, Pop',
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
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    Row(children: [
                      Image.asset('assets/images/calendar.png', height: 50),
                      SizedBox(width: 30),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '2023-02-01',
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
                              child: Text(
                                '21:00:00',
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
                      Image.asset('assets/images/price.png', height: 50),
                      //Expanded(child: Container()),
                      SizedBox(width: 30),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '56.5 - 287.5 EUR (including fees)',
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
                      Image.asset('assets/images/location.png', height: 50),
                      SizedBox(width: 30),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Palau Sant Jordi',
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
                              child: Text(
                                'Passeig Olímpic, 5-7, 08038 Barcelona',
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
              RedButton(text: "Buy tickets", function: () => {
                _launchUrl(_url)
              }),
              SizedBox(height: 20),
            ]),
          ),
        ],
      ));

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }else{
    }
  }
}
