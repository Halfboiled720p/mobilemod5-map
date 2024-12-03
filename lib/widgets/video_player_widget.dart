import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({
    Key? key,
    required this.videoPath,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    print('Initializing video player with path: ${widget.videoPath}'); // Debug log
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      // Verify file exists
      final file = File(widget.videoPath);
      if (!await file.exists()) {
        throw Exception('Video file does not exist at path: ${widget.videoPath}');
      }

      print('Creating video player controller'); // Debug log
      _controller = VideoPlayerController.file(file);

      print('Initializing controller'); // Debug log
      await _controller.initialize();

      print('Setting looping'); // Debug log
      await _controller.setLooping(true);

      if (mounted) {
        setState(() {
          _isInitialized = true;
          print('Video player initialized successfully'); // Debug log
        });
      }
    } catch (e, stackTrace) {
      print('Error initializing video player: $e'); // Debug log
      print('Stack trace: $stackTrace'); // Debug log

      if (mounted) {
        setState(() {
          _error = e.toString();
        });

        // Show a more detailed error message
        Get.snackbar(
          'Video Error',
          'Failed to initialize video player: $e',
          backgroundColor: Colors.red[400],
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  void dispose() {
    print('Disposing video player controller'); // Debug log
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            SizedBox(height: 8),
            Text(
              'Error memutar video\n$_error',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text(
              'Memuat video...',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        // Optional: Add play/pause button overlay
        Positioned(
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Play Button
              IconButton(
                onPressed: () {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                  setState(() {});
                },
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                iconSize: 40,
              ),
              SizedBox(width: 20),
              // Stop Button
              IconButton(
                onPressed: () {
                  _controller.seekTo(Duration.zero); // Reset video to the beginning
                  _controller.pause(); // Pause the video
                  setState(() {});
                },
                icon: Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
                iconSize: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
