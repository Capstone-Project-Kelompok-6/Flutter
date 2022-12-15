import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/video/video_screen.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SummaryOnlineClassDetail extends StatefulWidget {
  const SummaryOnlineClassDetail({
    Key? key,
    required this.classTitle,
    required this.classImage,
    required this.classVideoTitle,
    required this.classDesc,
    required this.video,
    required this.duration,
  }) : super(key: key);
  final String classTitle;
  final String classImage;
  final String classVideoTitle;
  final String classDesc;
  final String video;
  final Duration duration;

  @override
  State<SummaryOnlineClassDetail> createState() =>
      _SummaryOnlineClassDetailState();
}

class _SummaryOnlineClassDetailState extends State<SummaryOnlineClassDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, widget.classTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // workout image
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Image.network(
              //     widget.classImage,
              //     width: double.infinity,
              //     height: 185,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/explore/img4.png',
                  width: double.infinity,
                  height: 185,
                  fit: BoxFit.cover,
                ),
              ),

              // video title name
              const SizedBox(height: 24),
              Text(
                widget.classVideoTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: n100,
                ),
              ),

              // divider
              divider(),

              // informations
              const Text(
                'Informations',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: violet,
                ),
              ),
              const SizedBox(height: 18),

              // category and duration
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/booking_class/video.svg'),
                        const SizedBox(width: 8),
                        Text(
                          widget.classTitle,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: n100,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/booking_class/duration.svg'),
                        const SizedBox(width: 8),
                        Text(
                          '${widget.duration.inMinutes}m ${widget.duration.inSeconds}s',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: n100,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // description
              const SizedBox(height: 18),
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.classDesc,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: n80,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: double.infinity,
        height: 76,
        color: whiteBg,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoScreen(video: widget.video)));
            },
            style: ElevatedButton.styleFrom(
              primary: violet,
              minimumSize: const Size(146, 48),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
            ),
            child: const Text(
              "Watch Now",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            )),
      ),
    );
  }

  Widget divider() {
    return Column(
      children: const [
        SizedBox(height: 10),
        Divider(
          height: 12,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: n20,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
