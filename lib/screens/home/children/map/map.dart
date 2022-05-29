import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sampleproject/constants.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //COORDINATES
  double latitude = 35.139464;
  double longitude = 33.916866;

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(35.139464, 33.916866),
    zoom: 13.0,
  );
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: initialPosition,
                markers: markers,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 20, 120, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(30),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(27, 0, 0, 0),
                              spreadRadius: 0,
                              blurRadius: 5),
                        ],
                      ),
                      child: Text("MAP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 11, vertical: 10),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 12),
                          primary: primaryColor,
                        ),
                        onPressed: () async {
                          Position position = await _determinePosition();

                          final GoogleMapController mapController =
                              await _controller.future;
                          mapController.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(latitude, longitude),
                                  zoom: 17)));

                          markers.clear();

                          markers.add(Marker(
                              markerId: const MarkerId('currentLocation'),
                              position: LatLng(latitude, longitude)));

                          setState(() {});
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.location_history),
                              Text("My Location",
                                  style: TextStyle(color: Colors.white)),
                            ])),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled == false) {
      return Future.error("Location services are disabled.");
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return Future.error("Location permision has to be enabled.");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
