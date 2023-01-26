import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tickly/EventModel.dart';
import 'package:http/http.dart' as http;

import 'Global widgets/eventCard.dart';

class PantallaNearEvent extends StatefulWidget {
  @override
  _PantallaNearEventState createState() => _PantallaNearEventState();
}

class _PantallaNearEventState extends State<PantallaNearEvent> {
  late Position _currentPosition;
  bool _locationPermissionGranted = false;
  final _formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  String _startDate = "";
  String _endDate = "";
  String _locationString = "";
  double _distance = 60;
  int _distanceInt = 60;
  EventModel _data = EventModel(embedded: null, links: null, page: null);


  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = _formatter.format(DateTime(now.year, now.month, now.day));
    _endDate = _formatter.format(now.add(Duration(days: 5)));
    _getLocationPermission();
  }

  Future<EventModel> _search(String currentLocation, int distance, String startDate, String endDate) async {
    final uri = Uri.https('app.ticketmaster.com', 'discovery/v2/events', {
      'apikey': '7elxdku9GGG5k8j0Xm8KWdANDgecHMV0',
      'latlong': currentLocation,
      'radius': distance.toString(),
      'unit': "km",
      'locale': 'es',
      'startDateTime': startDate,
      'endDateTime': endDate,
      'size': "200",
      'sort': "distance,date,asc"
    });
    final response = await http.get(uri).catchError((error) => 0);
    if (response.statusCode == 200) {
      return EventModel.fromJson(jsonDecode(response.body));
    } else {
      return EventModel(embedded: null, links: null, page: null);
    }
  }

  _getLocationPermission() async {
    final permission = await Permission.location.status;
    if (permission == PermissionStatus.granted) {
      _locationPermissionGranted = true;
      _getCurrentLocation();
    } else {
      final permissionStatus = await Permission.location.request();
      if (permissionStatus == PermissionStatus.granted) {
        _locationPermissionGranted = true;
        _getCurrentLocation();
      } else {
        _locationPermissionGranted = false;
      }
    }
  }

  _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    _locationString = "${_currentPosition?.latitude},${_currentPosition?.longitude}";
    _search(_locationString, _distanceInt, _startDate, _endDate)
        .then((data) {
      setState(() {
        _data = data;
      });
    }).catchError((error) => {});

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Text("EVENTS AT $_distanceInt km FROM YOU", style: TextStyle(fontFamily: "jaldi", fontSize: 30, fontWeight: FontWeight.bold)),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red,
                  inactiveTickMarkColor:  Colors.red.withOpacity(0),
                  activeTickMarkColor:  Colors.red.withOpacity(0),
                  inactiveTrackColor: Colors.red.withOpacity(0.3),
                  thumbColor: Colors.red,
                  overlayColor: Colors.red.withOpacity(0),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                  valueIndicatorColor: Colors.red.withOpacity(0),
                  valueIndicatorTextStyle: const TextStyle(fontFamily: "jaldi", fontSize: 17, color: Color.fromRGBO(210, 36, 36, 1), fontWeight: FontWeight.bold),
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  value: _distance,
                  min: 20,
                  max: 200,
                  divisions: 9,
                  onChanged: (double newValue) {
                    setState(() {
                      _distance = (newValue / 20).round() * 20;
                      _distanceInt = _distance.toInt();
                      _search(_locationString, _distanceInt, _startDate, _endDate).then((data) {
                        setState(() {
                          _data = data;
                        });
                      }).catchError((error) => {});
                    });
                  },
                ),
              ),
              _data.embedded != null ?
              Expanded(
                child: ListView.builder(
                  itemCount: _data.page!.totalElements! < 200 ? _data.page!.totalElements! : 200,
                  itemBuilder: (context, index) {
                    if(_data.embedded!.events![index].embedded != null){
                      return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: _data.embedded!.events[index]!.embedded!.venues[0]!.country!.name!, city: _data.embedded!.events[index]!.embedded!.venues[0]!.city!.name!, link: _data.embedded!.events[index]!.url!, id: _data.embedded!.events[index]!.id!);
                    }else{
                      return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: "No country", city: "No city", link: _data.embedded!.events[index]!.url!, id: _data.embedded!.events[index]!.id!);

                    }
                  },
                ))
              : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [SizedBox(height: 40), Text("No events in your zone in the next 5 days. Try looking a bit further", textAlign: TextAlign.center, style: TextStyle(
                    fontFamily: "jaldi",
                    fontSize: 25))]
                ),
              ),
                    /*if(_data.embedded!.events![index].embedded != null){

                    }else{
                      return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: "No country", city: "No city", link: "link");

                    }*/
            ],
          ),
        ),
      ),
    );
  }
}


/*return Scaffold(
      appBar: AppBar(
        title: Text("Near Events"),
      ),
      body: _locationPermissionGranted
          ? Column(
        children: <Widget>[
          Text("Latitude: ${_currentPosition?.latitude}"),
          Text("Longitude: ${_currentPosition?.longitude}"),
        ],
      )
          : Center(
        child: Text("Permission not granted"),
      ),
    );
 */
