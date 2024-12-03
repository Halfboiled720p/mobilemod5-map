import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/location_controller.dart';

class MyLocationScreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());

  // Fungsi untuk membuka Google Maps dengan koordinat yang disimpan
  Future<void> openGoogleMaps() async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${locationController.latitude.value},${locationController.longitude.value}';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      Get.snackbar(
        'Error',
        'Tidak dapat membuka Google Maps',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('My Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await locationController.determinePosition();
                  Get.snackbar(
                    'Lokasi Tersimpan',
                    'Koordinat berhasil disimpan.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } catch (e) {
                  Get.snackbar(
                    'Gagal',
                    e.toString(),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text('Simpan Lokasi Saya'),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
              'Latitude: ${locationController.latitude.value}\nLongitude: ${locationController.longitude.value}',
              style: TextStyle(fontSize: 16),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: openGoogleMaps, // Fungsi untuk membuka Google Maps
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Buka Lokasi di Google Maps'),
            ),
          ],
        ),
      ),
    );
  }
}
