import 'package:flutter/material.dart';
import '../controllers/microphone_controller.dart';
import '../widgets/sensor_button.dart';
import 'package:get/get.dart';

class MicrophoneScreen extends StatelessWidget {
  final microphoneController = Get.put(MicrophoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Rekam Resep",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Obx(() => SensorButton(
                  icon: microphoneController.isListening.value ? Icons.stop : Icons.mic,
                  label: microphoneController.isListening.value ? "Hentikan Merekam" : "Mulai Merekam",
                  onPressed: () {
                    if (microphoneController.isListening.value) {
                      microphoneController.stopListening();
                    } else {
                      microphoneController.startListening();
                    }
                  },
                )),
                SizedBox(height: 10),
                Obx(() {
                  if (microphoneController.isListening.value) {
                    return ElevatedButton.icon(
                      onPressed: () => microphoneController.stopListening(),
                      icon: Icon(Icons.stop, color: Colors.white),
                      label: Text("Stop"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Rekam suara untuk mencatat resep masakan versi Anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Hasil Rekaman:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 10),
                Obx(() {
                  final transcription = microphoneController.recognizedWords.value;
                  return transcription.isNotEmpty
                      ? Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Text(
                      transcription,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  )
                      : Text(
                    microphoneController.isListening.value
                        ? "Mendengarkan..."
                        : "Belum ada hasil rekaman",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
