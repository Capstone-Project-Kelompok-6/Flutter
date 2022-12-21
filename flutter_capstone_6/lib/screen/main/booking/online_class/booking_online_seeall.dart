import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/class_online/class_online_rows.dart';
import 'package:flutter_capstone_6/screen/main/booking/online_class/booking_online_class_detail.dart';
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
  TextEditingController searchbarController = TextEditingController();
  String searchText = '';

  Future<Duration> getDuration(ClassOnlineRows classData) async {
    Duration duration = Duration.zero;
    // get video duration
    var session = await FFprobeKit.getMediaInformation(classData.video);
    final durationInfo = session.getMediaInformation()!.getDuration();

    // change to duration
    var seconds = double.parse(durationInfo!).round();
    duration = Duration(seconds: seconds);

    return duration;
  }

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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int j = 0;
                              j <
                                  widget.classOnlineRows3.values
                                      .toList()[i]
                                      .length;
                              j++)
                            if (widget.classOnlineRows3.values
                                .toList()[i][j]
                                .videoTitle
                                .toLowerCase()
                                .contains(searchText.toLowerCase()))
                              FutureBuilder<Duration>(
                                  future: getDuration(
                                      widget.classOnlineRows3.values.toList()[i]
                                          [j]),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const SizedBox();
                                    }

                                    final classData = widget
                                        .classOnlineRows3.values
                                        .toList()[i][j];

                                    // formatting duration
                                    format(Duration d) =>
                                        d.toString().substring(2, 7);
                                    String videoDuration =
                                        format(snapshot.data ?? Duration.zero)
                                            .toString();

                                    return GestureDetector(
                                      onTap: () {
                                        final classData = widget
                                            .classOnlineRows3.values
                                            .toList()[i][j];

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookingOnlineClassDetail(
                                                      classId:
                                                          classData.classId,
                                                      classTitle:
                                                          classData.workout,
                                                      classImage:
                                                          classData.thumbnail,
                                                      classVideoTitle:
                                                          classData.videoTitle,
                                                      classDesc:
                                                          classData.description,
                                                      price: classData.price,
                                                      video: classData.video,
                                                      duration: snapshot.data ??
                                                          Duration.zero,
                                                    )));
                                      },
                                      child: onlineClassCard(
                                          widget.classOnlineRows3.values
                                              .toList()[i][j]
                                              .thumbnail,
                                          widget.classOnlineRows3.values
                                              .toList()[i][j]
                                              .videoTitle,
                                          videoDuration),
                                    );
                                  })
                        ],
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onlineClassCard(String image, String title, String duration) {
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
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: NetworkImage(image),
                // image: AssetImage('assets/explore/img1.png'),
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
            child: Container(
              width: double.infinity,
              height: 35,
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBarItem() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        controller: searchbarController,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
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
          prefixIcon: Icon(
            Icons.search_rounded,
            color: n20,
          ),
        ),
      ),
    );
  }
}
