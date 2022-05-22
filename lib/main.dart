import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps',
      theme: ThemeData(
       
        primarySwatch: Colors.amber,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}


class _MapScreenState extends State<MapScreen> {
    static const _initialCameraPosition = CameraPosition(target: LatLng(13.693801588501765, -89.21430283721837),
    zoom: 11.5,
    );
    static const _primer = CameraPosition(target: LatLng(13.718751783447685, -89.13455823415507),
    zoom: 14.5,
    );
     static const _segunda = CameraPosition(target: LatLng(13.699998003914377, -89.19816643214955),
    zoom: 14.5,
    );
     static const _tercer = CameraPosition(target: LatLng(13.70155590798445, -89.22445536098556),
    zoom: 14.5,
    );
     static const _cuarta = CameraPosition(target: LatLng(13.688119300464322, -89.1901026168057),
    zoom: 14.5,
    );

    List<Marker>_marker=[];
    List<Marker>_list=const[
      Marker(markerId: MarkerId("1"),
      position: LatLng(13.718751783447685, -89.13455823415507), 
      infoWindow: InfoWindow(
        title: "Sucursal Soyapango"
      )),
      Marker(markerId: MarkerId("2"),
      position: LatLng(13.699998003914377, -89.19816643214955), 
      infoWindow: InfoWindow(
        title: "Sucursal Arce"
      )),
      Marker(markerId: MarkerId("3"),
      position: LatLng(13.70155590798445, -89.22445536098556), 
      infoWindow: InfoWindow(
        title: "Sucursal Salvador del mundo"
      )),
       Marker(markerId: MarkerId("4"),
      position: LatLng(13.688119300464322, -89.1901026168057),
       
      infoWindow: InfoWindow(
        title: "Sucursal San Jacinto"
      ))
    ];

    @override
    void initState() {
      super.initState();
      _marker.addAll(_list);
    }
    late final Completer<GoogleMapController> _googleMapController = Completer();
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const  Text("MovilSV"),
        actions: [
            TextButton(onPressed: () => _primeraIr(), 
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)
            ),
            child: const Text("1°"),),

             TextButton(onPressed: () => _segundaIr(), 
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)
            ),
            child: const Text("2°"),),
             TextButton(onPressed: () => _terceraIr(), 
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)
            ),
            child: const Text("3°"),),

             TextButton(onPressed: () => _cuartaIr(), 
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)
            ),
            child: const Text("4°"),),





        ],
      ),
      
      body: GoogleMap(
         markers: Set.of(_marker),
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition:  _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _googleMapController.complete(controller);
        }
      ),

    floatingActionButton: FloatingActionButton.extended(
        onPressed: _inicioGO,
        label: const Text('Ir al inicio'),
        icon: const Icon(Icons.home),
      ),
    );
  }
   Future<void> _inicioGO() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }

  Future<void> _primeraIr() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_primer));
  }
  Future<void> _segundaIr() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_segunda));
  }

  Future<void> _terceraIr() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_tercer));
  }
  Future<void> _cuartaIr() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_cuarta));
  }

  
}

