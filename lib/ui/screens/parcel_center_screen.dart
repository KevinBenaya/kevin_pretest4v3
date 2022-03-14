import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kevin_pretest4v3/widgets/my_parcel_office.dart';
import '/src/locations.dart' as locations;

class ParcelCenterScreen extends StatefulWidget {
  const ParcelCenterScreen({Key? key}) : super(key: key);

  @override
  State<ParcelCenterScreen> createState() => _ParcelCenterScreenState();
}

class _ParcelCenterScreenState extends State<ParcelCenterScreen> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();

    BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          size: Size(24, 24),
        ),
        'assets/images');

    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          icon: customIcon,
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Parcel centers',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 29),
              SizedBox(
                height: 221,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 2,
                  ),
                  markers: _markers.values.toSet(),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              const MyParcelOffice(
                  parcelOfficeCode: 'NY0924',
                  parcelOfficeHours: 'Available 24/7',
                  parcelOfficeName: '985 Meadow St.',
                  parcelOfficeAddress: 'Staten Island, NY 10306',
                  parcelOfficeStats: 'Fully occupied',
                  parcelOfficeStatsNumber: '1.0'),
              const MyParcelOffice(
                  parcelOfficeCode: 'NY0812',
                  parcelOfficeHours: 'Available 24/7',
                  parcelOfficeName: '54 West Adams Court',
                  parcelOfficeAddress: 'SRego Park, NY 11374',
                  parcelOfficeStats: 'Lots of empty space',
                  parcelOfficeStatsNumber: '0.3'),
            ],
          ),
        ),
      ),
    );
  }
}
