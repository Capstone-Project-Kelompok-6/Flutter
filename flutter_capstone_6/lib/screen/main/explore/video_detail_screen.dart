import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/content/content_rows.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoDetailScreen extends StatefulWidget {
  const VideoDetailScreen(
      {Key? key, required this.contentRows, required this.index})
      : super(key: key);
  final List<ContentRows>? contentRows;
  final int index;

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, ' Explore Video'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/explore/img1.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Gym from home",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: n100,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/explore/like.svg'),
                          const Text(
                            "Like",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/explore/dislike.svg'),
                          const Text(
                            "Dislike",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/explore/download.svg'),
                          const Text(
                            "Download",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/explore/stop.svg'),
                          const Text(
                            "Stop ads",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Videos Section
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recomended videos',
                      style: TextStyle(
                        color: n100,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      videoCard('img1.png', 'Gym from home', '04:52'),
                      videoCard('img2.png', 'Yoga meditation', '04:12'),
                      videoCard('img3.png', 'Zumba', '04:56'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget videoCard(String image, String title, String duration) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 16),
      width: 216,
      height: 119,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/explore/$image'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: n100.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: white,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: white.withOpacity(0.5),
                      color: n100,
                    ),
                    child:
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: 16,
                        //       height: 16,
                        //       child: SvgPicture.asset('assets/explore/time.svg'),
                        //     ),
                        //     const SizedBox(width: 4),
                        Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: white,
                      ),
                    ),
                    //   ],
                    // ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
