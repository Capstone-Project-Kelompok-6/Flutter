import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ChewieController? chewieController;
  late VideoPlayerController videoController;

  Future initVideo() async {
    videoController = VideoPlayerController.network(
        'https://storage.googleapis.com/clean-code-72e8f.appspot.com/online-class-video/67277a55f7874b41a93df7db33d79060.mp4?Expires=1702383500&GoogleAccessId=firebase-adminsdk-lenaf%40clean-code-72e8f.iam.gserviceaccount.com&Signature=lAj%2FLvC0rg5dn8iyGAIzaQ0PRWIRaZIsrZmglgi2DxWumi9UYSSuWTrlGmAZ48TWAgR2B%2FnZHJbJONzY1ITb5xPN6p40BB0D1LPkNKFZb8k6oS%2BcrByDl3oFfc4mKxWzHUF5G8QIzwbwv7nYCySMqjAq55dXlqVpnKETYTSpBYqgXpmsrC%2Bxzq%2FSMhjlZCHvpQh%2Bk1jposqY1WXSRhN1jhDCWqcCdFowEdMU4gwtzfhtnIl%2FIG02BC4jsZeKeWCPk7tFlyLa9o97kctWxQDd0VhSYxiViWW6bT33W5qKaFfFwFtlH2xfGJl%2FL%2B3p2oS9XeMs7fEzE6iRIKJRh4bNYg%3D%3D');
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Center(
          child: chewieController != null &&
                  chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(controller: chewieController!)
              : CircularProgressIndicator()),
    );
  }
}
