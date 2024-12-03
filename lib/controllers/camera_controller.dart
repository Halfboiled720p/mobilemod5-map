import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var imagePath = ''.obs;
  var imageBytes = Rx<Uint8List?>(null);
  var videoPath = ''.obs;
  var isLoading = false.obs;

  // Fungsi untuk memilih gambar
  Future<void> pickImage() async {
    try {
      isLoading.value = true;
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        imageBytes.value = await image.readAsBytes();
        imagePath.value = image.path;

        Get.snackbar(
          'Berhasil',
          'Gambar berhasil dipilih',
          backgroundColor: Colors.green[400],
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(16),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memilih gambar: ${e.toString()}',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
      );
      print('Error picking image: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk memilih video
  Future<void> pickVideo() async {
    try {
      isLoading.value = true;
      final XFile? video = await _picker.pickVideo(
        source: ImageSource.gallery,
      );

      if (video != null) {
        videoPath.value = video.path; // Simpan path video
        print('Selected video path: ${video.path}'); // Tambahkan log ini

        // Verifikasi file video
        final file = File(video.path);
        final exists = await file.exists();
        print('Video file exists: $exists'); // Tambahkan log ini
        print('Video file size: ${await file.length()} bytes'); // Tambahkan log ini

        Get.snackbar(
          'Berhasil',
          'Video berhasil dipilih',
          backgroundColor: Colors.green[400],
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(16),
        );
      }
    } catch (e) {
      print('Error picking video: $e');
      Get.snackbar(
        'Error',
        'Gagal memilih video: ${e.toString()}',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
