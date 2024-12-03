import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/location_controller.dart';

class AccountScreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());

  // Fungsi untuk logout dan kembali ke halaman login
  Future<void> logout() async {
    // Hapus sesi atau token jika diperlukan, misalnya menggunakan FirebaseAuth:
    // await FirebaseAuth.instance.signOut();

    // Setelah logout, arahkan ke halaman login
    Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Pengelolaan Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: logout, // Fungsi untuk logout
              tileColor: Colors.red.shade100,
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            SizedBox(height: 40),
            Divider(color: Colors.grey),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.orange),
              title: Text('My Location'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.toNamed('/my-location');
              },
            ),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.orange),
              title: Text('Edit Profil'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.toNamed('/edit-profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.orange),
              title: Text('Ganti Password'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.toNamed('/change-password');
              },
            ),
            ListTile(
              leading: Icon(Icons.bug_report, color: Colors.orange),
              title: Text('Bug Report'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.toNamed('/bug-report');
              },
            ),
          ],
        ),
      ),
    );
  }
}
