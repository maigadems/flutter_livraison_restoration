import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'choixMode.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {

  // Qui va controller l'api google Maps;
   Completer<GoogleMapController> _controller = Completer();

  // Pour initialiser la position;
  static const CameraPosition initialPosition  = CameraPosition(target:
  LatLng(37.333445677666, -122.44422282829), zoom: 12.0);

  // Lorsqu'on appuie sur le floatingactionButton
  static const CameraPosition targetPosition  = CameraPosition(target: LatLng
    (33.333445677666, -137.44422282829), zoom: 14.0, bearing: 192, tilt: 60);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(initialCameraPosition: initialPosition, mapType:
      MapType.normal,onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
        ChoisirModePayement();
      },
          label: Text('Get localisation'),
        icon: Icon(Icons.location_on_outlined),),

    );
  }
  Future<void> gotoLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
