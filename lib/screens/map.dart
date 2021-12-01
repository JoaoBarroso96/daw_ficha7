import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoute extends StatefulWidget {
  @override
  _MapRoute createState() => new _MapRoute();
}

class _MapRoute extends State<MapRoute> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = HashSet<Marker>();

  @override
  void initState() {
    _markers.add(Marker(
        markerId: MarkerId("LagoaFogo"),
        position: LatLng(37.764322, -25.489797)));

    _markers.add(Marker(
        markerId: MarkerId("LagoaDasFurnas"),
        position: LatLng(37.765543, -25.334100)));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.818066, -25.519608),
    zoom: 14,
  );

  static final CameraPosition _home =
      CameraPosition(target: LatLng(37.7481882, -25.6655237), zoom: 17);

  static final CameraPosition _favorito =
      CameraPosition(target: LatLng(37.8546248, -25.7756257), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                ),
                label: const Text('Favorito'),
                onPressed: () {
                  _goClickFavo();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.home,
                  color: Colors.yellow,
                  size: 24.0,
                ),
                label: const Text('Home'),
                onPressed: () {
                  _goClickHome();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _markers,
          ),
        ),
        Container(),
      ],
    ));
  }

  Future<void> _goClickHome() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_home));
  }

  Future<void> _goClickFavo() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_favorito));
  }
}
