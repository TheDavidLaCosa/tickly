import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PantallaNearEvent extends StatefulWidget {
  @override
  _PantallaNearEventState createState() => _PantallaNearEventState();
}

class _PantallaNearEventState extends State<PantallaNearEvent> {
  late Position _currentPosition;
  bool _locationPermissionGranted = false;
  double _distance = 60;

  @override
  void initState() {
    super.initState();
    _getLocationPermission();
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
              Text("EVENTS AT $_distance km FROM YOU", style: TextStyle(fontFamily: "jaldi", fontSize: 30, fontWeight: FontWeight.bold)),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red,
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
                  //label: '$_distance' + 'km',
                  onChanged: (double newValue) {
                    setState(() {
                      _distance = (newValue / 20).round() * 20;
                    });
                  },
                ),
              )
              /*Expanded(
                child: /*ListView.builder(
                  itemCount: _data.page!.totalElements! < 200 ? _data.page!.totalElements! : 200,
                  itemBuilder: (context, index) {
                    if(_data.embedded!.events![index].embedded != null){
                      return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: _data.embedded!.events[index]!.embedded!.venues[0]!.country!.name!, city: _data.embedded!.events[index]!.embedded!.venues[0]!.city!.name!, link: "link");
                    }else{
                      return eventCard(image: _data.embedded!.events[index]!.images[0]!.url!, title: _data.embedded!.events[index]!.name!, time: DateFormat('yyyy-MM-dd').format(_data.embedded!.events[index]!.dates!.start!.localDate!), country: "No country", city: "No city", link: "link");

                    }
                  },
                ),*/
              ),*/
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
