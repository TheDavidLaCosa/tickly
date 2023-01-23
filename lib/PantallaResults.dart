import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Global widgets/eventCard.dart';

class PantallaResults extends StatefulWidget {
  const PantallaResults({super.key});

  @override
  State<PantallaResults> createState() => _PantallaResultsState();
}

class _PantallaResultsState extends State<PantallaResults> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
        title: const Text('TIKLY', style: TextStyle(fontFamily: "jaldi", fontSize: 30)),
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
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              color: const Color.fromRGBO(232, 231, 231, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text("HERE IS WHAT WE FOUND!", style: TextStyle(fontFamily: "jaldi", fontSize: 30, fontWeight: FontWeight.bold)),
                  eventCard(),
                  eventCard(),
                  eventCard(),
                  eventCard(),
                  eventCard(),
                  eventCard(),
                  eventCard(),
                  eventCard(),
                  eventCard(),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
