import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ChewieController? chewieController;
  late VideoPlayerController videoController;

  Future initVideo() async {
    videoController = VideoPlayerController.network(
        'https://storage.googleapis.com/coba-notif-51a0f.appspot.com/online-class-video/ba43cf8680244e2491826c008b8c4c9d.mp4?Expires=1702614625\u0026GoogleAccessId=firebase-adminsdk-wlnrd%40coba-notif-51a0f.iam.gserviceaccount.com\u0026Signature=aMxKGwtS48djGYRBb16zISLE9MR%2BMYSe0AtGBNypTmTVVngElJ5%2Bd%2FbdZJy%2Flbug2Cm9uShOCRBD6ZgNPSEsGAorr91mmvwkuOITDHCWWaokJ2BgTeWHEcX6iJEeBMFG5v4zF2Kh5k4jC0s%2FZLbHmDTCI%2Bm1DMup%2Fyr7CMerJaUY6gwWA2ehDM7GY7Vu1eXLmi0JDy2i5gaSI9v%2FcAewpg%2BdD6niSWE1K6I1GGgmUf2eZEFwCtrvS9%2BvW9E1k%2FK7vMvNjh5T2tvG17jcAzET1W5RBmtyMsJZt1BJcfx1VP3qgPV8kA9hK%2FMrnhveckMIp122cAzuFYQFvFnatDPT5w%3D%3D');
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
              : const CircularProgressIndicator()),
    );
  }
}
