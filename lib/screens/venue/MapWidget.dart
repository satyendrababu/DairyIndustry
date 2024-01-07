import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatefulWidget {

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(17.470801,78.374193);

  void _openGoogleMaps() async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${_center.latitude},${_center.longitude}';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      // Handle the case where the user doesn't have Google Maps installed.
      print('Could not launch Google Maps');
    }
  }

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('markerId'),
      position: LatLng(17.470801,78.374193),
      infoWindow: InfoWindow(title: 'HITEX Exhibition Center'),
    ),
    // Add more markers as needed
  };
  MapType _currentMapType = MapType.normal;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void _toggleMapType() {
    setState(() {
      _currentMapType = (_currentMapType == MapType.normal)
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,

            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 17.0,
            ),
            markers: _markers,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    _openGoogleMaps();
                  },
                  child: Container(
                    height: 45,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HITEX Exhibition Center',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          'View larger map',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}