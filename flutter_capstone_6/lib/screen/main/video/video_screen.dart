import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.video}) : super(key: key);
  final String video;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ChewieController? chewieController;
  late VideoPlayerController videoController;

  Future initVideo() async {
    videoController = VideoPlayerController.network(widget.video);
    await videoController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoController,
        showControls: true,
        aspectRatio: videoController.value.aspectRatio,
        showControlsOnInitialize: false,
        allowFullScreen: true,
        autoInitialize: true,
        autoPlay: false,
        looping: false,
        showOptions: true,
        errorBuilder: (context, string) {
          return Center(
              child: Text(
            string,
            style: const TextStyle(color: Colors.white),
          ));
        },
        allowPlaybackSpeedChanging: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
        ));

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initVideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chewieController!.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[5],
      appBar: appBar(context, 'Watch Video'),
      body: Center(
          child: chewieController != null &&
                  chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(controller: chewieController!)
              : const CircularProgressIndicator()),
    );
  }
}
