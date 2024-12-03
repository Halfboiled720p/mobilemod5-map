import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var mapController = Rx<GoogleMapController?>(null);

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Periksa apakah layanan lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Layanan lokasi tidak aktif.');
    }

    // Periksa izin lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Izin lokasi ditolak.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Izin lokasi ditolak secara permanen.');
    }

    // Ambil posisi terkini
    final position = await Geolocator.getCurrentPosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;

    // Pindahkan kamera peta ke lokasi terbaru
    if (mapController.value != null) {
      mapController.value?.animateCamera(
        CameraUpdate.newLatLng(LatLng(latitude.value, longitude.value)),
      );
    }
  }

  // Untuk mendapatkan posisi dan membuat marker pada peta
  Set<Marker> getMarkers() {
    return {
      Marker(
        markerId: MarkerId('user_position'),
        position: LatLng(latitude.value, longitude.value),
        infoWindow: InfoWindow(title: 'Lokasi Saya'),
      ),
    };
  }
}
