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
        'https://storage.googleapis.com/clean-code-72e8f.appspot.com/online-class-video/bec58991f9b74e2b9ab19ab31b703fff.mp4?Expires=1702545208\u0026GoogleAccessId=firebase-adminsdk-lenaf%40clean-code-72e8f.iam.gserviceaccount.com\u0026Signature=tFbqAMDcDqBWBrEv3WV88i9iwUCXU7Mr4tfXzBgYs8vI01buP9MvKzMckQwJJ3kcw5V9Bv17EXNcvbE4QGKLGjuFdwMOSVhqsfzuVrv4S652turmUBUeicyRTrBUrSMh2Gc03%2BTUJ04IKmU1icEBtaTjNTAjPNKuwwFqPdla15ujsGDL6PyrolCK6IDOj6kW%2BwHC37MwResdJzI2ZH87tkq28mcrDVHglqx8XMWf1XnrP0gtSR91Pc%2F%2BNXbm7U768h4609san2bNQiAdpn%2F9JL2JBl0tTiPKDjxtfc6EpGGCYd5Pabtc55DLzxgsGk6OmYkDhWywQebaXCBHYFZU6A%3D%3D');
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
