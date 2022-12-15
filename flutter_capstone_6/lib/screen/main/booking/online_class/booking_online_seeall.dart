import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/class_online/class_online_rows.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';

class BookingOnlineSeeAll extends StatefulWidget {
  BookingOnlineSeeAll(
      {Key? key, required this.title, required this.classOnlineRows3})
      : super(key: key);
  String title;
  Map<String, List<ClassOnlineRows>> classOnlineRows3;

  @override
  State<BookingOnlineSeeAll> createState() => _BookingOnlineSeeAllState();
}

class _BookingOnlineSeeAllState extends State<BookingOnlineSeeAll> {
  String videoDuration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, widget.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              searchBarItem(),
              const SizedBox(height: 12),
              for (int i = 0; i < widget.classOnlineRows3.keys.length; i++)
                if (widget.title == widget.classOnlineRows3.keys.toList()[i])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: SizedBox(
                      height: 245,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            widget.classOnlineRows3.values.toList()[i].length,
                        itemBuilder: (context, index2) {
                          final classData = widget.classOnlineRows3.values
                              .toList()[i][index2];

                          // get video duration
                          FFprobeKit.getMediaInformation(classData.video)
                              .then((session) {
                            final durationInfo =
                                session.getMediaInformation()!.getDuration();

                            // change to duration
                            var seconds = double.parse(durationInfo!).round();
                            Duration duration = Duration(seconds: seconds);

                            // formatting duration
                            format(Duration d) => d.toString().substring(2, 7);
                            videoDuration = format(duration).toString();

                            print("${classData.videoTitle}: $videoDuration");

                            // print("this see all");
                          });

                          return onlineClassCard('image', classData.videoTitle,
                              classData.description, videoDuration);
                        },
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }

  Widget onlineClassCard(
      String image, String title, String description, String duration) {
    return Container(
      width: 361,
      margin: const EdgeInsets.only(bottom: 12, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: n40.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 3,
          )
        ],
        color: white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage('assets/explore/img4.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: n100,
                        ),
                        child: Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: n60,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget searchBarItem() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        decoration: const InputDecoration(
          fillColor: white,
          labelText: 'Search',
          labelStyle: TextStyle(
            fontSize: 16,
            color: n20,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: n100),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: n60)),
          contentPadding: EdgeInsets.all(12),
          // prefixIcon: Container(
          //   margin: const EdgeInsets.only(
          //       left: 20, right: 8, top: 14, bottom: 14),
          //   child: SvgPicture.asset(
          //     'assets/icons/search.svg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: n20,
          ),
        ),
      ),
    );
  }
}
