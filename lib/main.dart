import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/microphone_screen.dart';
import 'screens/speaker_screen.dart';
import 'screens/account_screen.dart' as account_screen ;
import 'screens/my_location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Resep & Sensor',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/camera', page: () => CameraScreen()),
        GetPage(name: '/microphone', page: () => MicrophoneScreen()),
        GetPage(name: '/speaker', page: () => SpeakerScreen()),
        GetPage(name: '/account_screen', page: () => account_screen.AccountScreen()),
        GetPage(name: '/my-location', page: () => MyLocationScreen()), // Route untuk MyLocationScreen
      ],
    );
  }
}
